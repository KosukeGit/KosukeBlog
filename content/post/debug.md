+++
date = "2018-02-27"
title = "Xcodeデバッグ術まとめ"
slug = "debug"
description = "XcodeやSwiftを使ったデバッグ術のまとめ"

categories = [
	"Tips"
]
tags = [
	"xcode",
	"swift"
]
archives = ""
keywords = [
	"Kosuke Blog",
	"こうすけブログ",
	"Swift",
	"Xcode",
	"Debug",
	"デバッグ",
	"lldb"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2018-02-27/debug.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

今回は個人的に便利だと思うデバッグの方法をまとめてみました！

<br>

<br>

## Xcode lldbコマンド

ブレークポイントでプログラムを止めた際に、  
コンソールに表示される (lldb) にコマンドを入力することができます。  
これから紹介するコマンドを頭に入れておけば  
素早くデバッグに取りかかることができるようになります。

<br>

- p または print (プリミティブ型の変数の値を表示)
- po (オブジェクト型の変数の値の表示)

これを知っておけば、値をちょこっと確認したい時に  
わざわざコードにprint(~)を埋め込む必要がなくなり、  
リアルタイムで値を見れます。

また、以下のように式の評価を行うことが可能です。

```
var a = 1
var b = 2
```

上記のようなプロパティがあったとします。  
この時、aとbは同じ値かどうか知りたい場合にはlldbで以下のように入力してみると  
デバッグ中に式の評価をすることが可能です。大変便利です。

`p a == b` -> falseが返ってくる  
`p a == 1` -> trueが返ってくる  
`p b == 1` -> falseが返ってくる  

<br>

- s (ステップイン)
- c (次のbreak point まで飛ばす)

一度入力した後は、入力し直さなくても  
Enterボタンを押せばそのまま続けられるので便利です。

<br>

- h (ヘルプ)

使いたいコマンドを一覧表示することができます

また、コマンドの中には  
`br l` でブレークポイントの一覧を表示してくれたりするものや  
`q` で終了させるものもあるので一度見てみるといいと思います。

<br>

<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- BlogAdsense_Top -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-9828180917254396"
     data-ad-slot="2510862598"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

<br>

## Filter

デバッグエリアの下にあるFilterというプレースホルダーのところに  
フィルタリングしたい文字を入力すると、デバッグで表示される全ての実行結果から  
特定の文字のみで表示させることができるのでピンポイントで結果の値を見たい際に便利です。

また、実行結果の中で `command + F` でキーワード検索を行ってもよいですが、  
ピンポイントでその部分だけみたい際にはこちらの方が圧倒的に便利です。

<br>

<br>

## Breakpoint

- Deactivate Breakpoints

全てのブレークポイント は `command + Y` でオンオフできます。

<br>

- Edit Breakpoint

ブレークポイントを貼った部分から右クリックを押して `Edit Breakpoint...` を選択します。  
その後、Conditioinに条件を記入するとそのタイミングでブレークします。

例えば下記のようなループの中のカウントがn回目になったときブレークしたい時に使えます。

```
let arr = ["a", "b", "c"]
for i in 0..<arr.count {
    print(arr[i])  // ここでブレークを貼り、i == 1 と設定すると i が 1 の時だけブレークになります。
}
```

また、逆にn回目はブレークをスルーしたい場合には、  
ignore を設定してあげるとn回目にそこを通ったときはブレークをスルーしてくれます。

<br>

- Exception breakpoint

ナビゲーターエリアの左下にある＋マーク(create a breakpoint) から
`Exception breakpoint...` を選択しておけばクラッシュする直前でブレークしてくれます。

<br>

- po $arg1

また、`Exception breakpoint...` を選択後に表示される設定の中の  
Action から Debugger Command を選択し、`po $arg1` を入力しておきます。  
すると、ブレークすると同時にブレークの原因となるログを吐き出してくれます。

<br>

<br>

## Debug View Hierarchy

Debug View Hierarchy は、今表示しているViewなどの階層を視覚的に見れる便利な方法です。

表示の仕方は簡単で、デバッグ中に現れるデバッグエリアの上にあるボタンの中に  
Debug View Hierarchy があるので、それを押すとXcode上で表示されます。  
再開する際はブレークポイントで止まったのを再開させる時と同様に  
Continue program execution を押します。

階層表示中にクリックしたものがどのクラスのものか確認したり、  
今の画面で一番上に表示しているViewは何Viewでその下のSubViewが  
どうなっているのかなど、すぐに知りたい時に知れる便利な方法です。

<br>

<br>

## Built-In Identifiers

- `#file`：ファイル名（String型）
- `#line`：行数（Int型）
- `#column`：文字の位置（Int型）
- `#function`：関数名（String型）

少しマイナーなデバッグ方法を紹介します。  
これらを使い、関数などで呼ぶことで  
その関数の行数やファイル名を表示させることができます。

```
/// 使い方

/// 怪しいと思う関数内でresult()を呼び出す
/// 今回は doSomething関数 が怪しいと思うので
/// ここでresult()を読んでみる。他にも怪しいと思う部分にresult()を入れる。
func doSomething() {
    /*
    何かしらの処理
        .
        .
        .
     */
    var errorMessage = "!!error message!!"
    result(message: errorMessage)  // 仮にここが50行目だとする
}


/// デバッグ用関数
/// 呼ばれた関数名がprintで表示される。
/// 今回は 50行目の doSomething() から呼ばれていることがわかった。
func result(message: String = "", file: String = #function, line: Int = #line) {
    #if DEBUG
        print("failed at \(function):\(line): \(message)")
        // -> "failed at doSomething():50: !!error message!!"
    #endif
}

```

参考：https://developer.apple.com/swift/blog/?id=15

<br>

<br>

## Debug Navigator

デバッグ中にナビゲーターエリアの `Debug Navigator` を押せば、  
処理の様々な情報を見ることができます。(右から3つ目のアイコン(Xcode9にて))  
ブレークポイントを貼っておき、ブレークで止まった際に  
Debug Navigator を押すとその部分までの処理の流れをスレッドごとに  
見ることができるので、大変便利だと思います。

<br>

<br>

よく使うものからマイナーなやり方までまとめてみました。  
この記事を見つけて読んでくれた方が少しでも参考になったと思ってくれたら満足です :)

<br>

<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- BlogAdsense_Bottom -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-9828180917254396"
     data-ad-slot="9212002313"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>