+++
date = "2017-05-21"
title = "gitignoreについて"
slug = "gitignore"
description = "自分で設定したGitのコマンドを使えるようにする方法"

categories = [
	"Git"
]
tags = [
	"terminal",
	"github"
]
archives = ""
keywords = [
	"Kosuke Blog",
	"こうすけブログ",
	"Git",
	"GitHub",
	"ターミナル",
	"gitignore",
	"gitコマンド"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2017-05-21/github.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

## .gitignore とは

"ignore = 無視する"という意味の通り、Gitのバージョン管理の対象から外すファイル（＝無視するファイル）を .gitignore に書いておき、その設定ファイルをルートディレクトリに置いておくことで git add . などを行ったときでもそのファイルだけ自動で無視をするようになります。そのため、間違えてプッシュしてしまったといったことを回避することができます。


### 生成の仕方

ターミナルで vim .gitignore を打つことによって .gitignore が生成され、vim が立ち上がります。i コマンドで insertモードに切り替え、中に対象のファイルを書き込んでいきます。（書き方については後述します）その後、escキーを押して :wq で保存&終了を行います。

<br>

<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- BlogAdsense_Middle -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-9828180917254396"
     data-ad-slot="2239399852"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

<br>

### 書き方

- `\#`：**コメント**

- `*.ipa`：**その拡張子はすべて無視したいとき**  
→ .ipa のつく拡張子はすべて無視する。

- `/test`：**このファイルの全てを無視する**  
→ 末尾に / がない場合は test と test 以下のファイル or ディレクトリを無視する。

- `test/`：**その名前のディレクトリ全て無視される**  
→ ルートディレクトリとそのサブディレクトリ内の test というディレクトリ名全てを無視する

- `~~/~~/test/（~~/~~/test）`：**そのファイル or ディレクトリのみ無視する**  
→ 最初と最後が / の時はそのファイル or ディレクトリのみを指定して無視する。この場合は test のみを無視する。

- `!/~~/~~/test.text`：**無視するのを無効にする**（＝そのファイルは無視しない）  
→ 例えば * で書いてあるとき、その中の test.text は無視したくないときに使用する。

<br>

他にも書き方がありますが、とりあえずはこのあたりを押さえておくといいと思います。
また、実際に使用する際には**[ここ](https://github.com/github/gitignore)**から対象のもの（例えば Swift で書いているのであれば Swift.gitignore ）を見るなどして参考にするとよいと思います。  
初めは、そのファイル自体をクローンしてリネーム（.gitignore に変更）してルートディレクトリ直下に入れておけばコンフリクトなどの回避をすることができます。
ちなみにリネームする際はターミナルから行います。（Swift.gitignore  から .gitignore  にリネームする時：`mv Swift.gitignore .gitignore`）

また、隠しフォルダをファインダーで開く際は、`command + shift + .` で見ることが可能です！

<br>

### 補足

**GitHub上から .gitignore の設定を行う場合**

Create a new repository で新しいリポジトリの作成時に下の方に`Add  .gitignore: None`となっているところがあるので、そこを押して使用する言語のものを選択すれば自動で生成してくれます。

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