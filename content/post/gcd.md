+++
date = "2017-10-22"
title = "GCD(Grand Central Dispatch)についてまとめ"
slug = "gcd"
description = "GCD(Grand Central Dispatch)を使ったマルチスレッドについてまとめ"

categories = [
	"Programming"
]
tags = [
	"ios",
	"objective-c",
	"swift",
]
archives = ""
keywords = [
	"Kosuke Blog",
	"こうすけブログ",
	"Swift",
	"Objective-C",
	"マルチスレッドプログラミング",
	"GCD"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2017-10-22/gcd.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

## GCD

マルチスレッドを簡単に処理してくれる **GCD** (Grand Central Dispatch) についてまとめてみました。

<br>

<br>

#### 気をつける点（しないように心がける点）

- **データ競合**  
複数のスレッドから同じリソースを更新しようとしてデータの不整合が発生する

- **デッドロック**  
イベントを待つためのスレッドを停止する仕組みにより複数のスレッドが相互に待ち続ける

- **多数のスレッドを使用しすぎて大量のメモリを消費する**

<br>

<br>

##### キューの種類

- `Serial Dispatch Queue`：1つのスレッドに追加された順番に処理を実装する  
→ 競合を起こしそうな場合は安全に用いる

- `Concurrent Dispatch Queue`：複数のスレッドを使って追加された処理を実行する  
→ 起こさない処理は平行に用いる

<br>

例えばDBから値を取得して、それを渡すときは **Serial Dispatch Queue** を  
1つのデータにつき1つ複数のスレッドを生成して処理を実行させるとよい。

ちなみに...

Main Dispatch Queue はメインスレッドが1つしかないので **Serial Dispatch Queue** になり、  
Global Dispatch Queue はアプリケーション全体から使用できる **Concurrent Dispatch Queue** である。

<br>

<br>

##### スレッド処理の順番

- `Serial`：処理の順番は実行させてからなので順番

- `Concurrent`：一度に複数の処理を行うためバラバラ

<br>

複数のキューからデータを更新する場合は、競合が起きる可能性があるので**serial**キューを使用すべき。  
また、いくつもの**serial**キューを作って平行に処理させるのは良いが、  
多すぎるとメモリ上の問題に直面してしまうので必要な数だけ作るべき。

<br>

<br>

#### Dispatch Group

Dispatch Queue に追加した複数の処理が全て終了したときに終了処理を行いたいときに使用する。  
どんな Dispatch Queue に処理が追加されていても、それら全てが終了するまで監視することができ、  
全ての処理の実行終了を検知したら **Dispatch Queue** に終了処理を追加することができるのが一番の利点である。

<br>

<br>

#### 同期と非同期

- `dispatch_async`：非同期

- `dispatch_sync`：同期（その処理が終わるまで待つ）

<br>

<br>

#### 様々な処理

<br>

- **dispatch_after**

〜秒後に処理を Dispatch Queue に追加します。  
〜秒後に処理を実行するではなく Dispatch Queue に Block を追加するという意味なので注意しましょう。

<br><br>

- **dispatch_barrier_async**

指定した場所までに Concurrent Dispatch Queue に追加された  
並列に実行されているすべての処理の実行が終了してから  
指定された処理をその Concurrent Dispatch Queue に追加する。  
そして、**dispatch_barrier_async** 関数によって追加された処理の実行が終了したら  
通常の Concurrent Dispatch Queue の動作に戻り、  
その Concurrent Dispatch Queue に追加されていた処理をまた並列に実行し始めることができます。  

<br>

例えば、読み込み処理は Concurrent Dispatch Queue で行いたいが、  
その途中で書き出しをしようとすると、読み込んだ後でないといけない。そんな場合に使用します。  

使い方としては、dispatch_async 関数の代わりに  
**dispatch_barrier_async** 関数を使用するだけです。

```
例
dispatch_async(queue, reading01)
dispatch_async(queue, reading02)
dispatch_async(queue, reading03)
dispatch_barrier_async(queue, writing)
dispatch_async(queue, reading04)
dispatch_async(queue, reading05)
　　　　　　　　　　・
　　　　　　　　　　・
　　　　　　　　　　・
```

これによって効率のよいデータベースアクセスやファイルアクセスを実装することができます。

<br><br>

- **dispatch_apply**

dispatch_sync関数やDispatch Groupに関連するAPI。  
この関数は、指定した回数分、指定したBlockを指定した Dispatch Queue に追加し、  
それら全ての処理を実行が終了するまで待つAPIである。  
注意すべき点としては、dispatch_sync 関数と同様に処理の実行終了を待ってしまうので  
dispatch_async 関数で非同期実行しながら使いましょう。

<br><br>

- **dispatch_suspend と dispatch_resume**

**dispatch_suspend** は Dispatch Queue には追加されているが  
まだ実行されていない処理をこれ以降一切実行させないときに用いる。

**dispatch_resume** は実行させるようにする際に用いる。

<br><br>

- **dispatch_semaphore**

並列に実行される処理によってデータ更新をする場合データの不整合やアプリケーションの不正終了が起こるときがあり、  
それを回避するために Serial Dispatch Queue や dispatch_barrier_async 関数を使うことで回避できるが、  
より粒度の細かな排他制御を行う際に用いります。

<br><br>

- **dispatch_once**

指定した処理をアプリケーション実行中に一度だけしか実行されないことを証明するためのAPI。  
マルチスレッド環境下でも、完全に安全であることが証明される。

<br><br>

- **Dispatch I/O**

大きなファイルを読み込む際に、Global Dispatch Queue を使ってファイルを適度な大きさに分割して  
平行に読むことで速く読み込めないかという際に用いる。  
複数スレッドを使って複数並列に読み込むのが速いときもあり、  
それを実現するのが **Dispatch I/O** と **Dispatch Data** である。

<br><br>

- **Dispatch Source**

「kqueue」のラッパーで、Foundationフレームワークを使用するだけで使用可能（GCDの恩恵を受けられる）。
 
例えば、DISPATCH_SOURCE_TYPE_TIMERなどを用いればネットワークプログラミングでの通信タイムアウトなどに使用できる。  
また、Dispatch Queue では処理を追加したらキャンセルはできないが、  
この Dispatch Queue ではキャンセルすることが可能である。

<br>

<br>

#### 参考書籍

ちなみに ARCやBlocks、GCD周りはこちらの書籍が大変わかりやすく載っているのでオススメです。  
今回の記事もこちらを参考にしました。

<br>

<iframe style="width:120px;height:240px;" marginwidth="0" marginheight="0" scrolling="no" frameborder="0" src="https://rcm-fe.amazon-adsystem.com/e/cm?ref=tf_til&t=kosukeblog06-22&m=amazon&o=9&p=8&l=as1&IS2=1&detail=1&asins=4844331094&linkId=e4b3d393321b376cead38ec70bfa215a&bc1=000000&lt1=_blank&fc1=4a4a4a&lc1=349ef3&bg1=ffffff&f=ifr">
    </iframe>

<br>

Swiftメインでコード書いてる方からすれば、今更Objective-Cの書籍？ってなりますが、  
GCDなどについて理解を深めたい方にはもってこいの一冊なので一度参考にしてみてはいかがでしょうか。  
今ならAmazonだとロープライス300円くらいで手に入るのでオススメです。