+++
date = "2017-10-18"
title = "Xcode9に上げたらまずはやっておきたい設定"
slug = "xcode9"
description = "Xcode9に上げた際にしておくとよい設定"

categories = [
	"Editor"
]
tags = [
	"xcode"
]
archives = ""
keywords = [
	"Kosuke Blog",
	"こうすけブログ",
	"Xcode",
	"Xcode9",
	"Jumps to Definition"
]

autoThumbnailImage = true
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2017-10-18/xcode.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

### Jumps to Definition

Xcode8ではキーボードのCommandを押しながら定義をクリックすると、定義元に一発で飛ぶことができましたが、  
Xcode9では新しい機能でどんなアクションをするかメニューが開き、から`Jump to Definition`を選択しないといけません。  
そのため、設定を開かずワンクリックで定義元に飛ぶように戻したい際は、下記の手順で設定すればXcode8同様の動作に戻ります。

`Xcode` -> `Preferences...` -> `Navigation` -> `Command-click on Code` を `Jumps to Definition`に設定

<br>

ちなみにPreferencesは`Command` + `,`で開くことができます。

<br>

<br>

### Refactor

Xcode9では、ようやくリファクタリング機能が実装されました。  
`command` + `option` + `F` で十分かなとは思っていたのですが、これはこれで便利な機能ですね。ショートカットを設定しておくと便利かもしれません。

`Editor` -> `Refactor` -> `Rename`

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

### New Build System

ライブラリを多用していたりするとビルドに時間がかかり、  
待ち時間が場合によってはストレスになりますよね。

そんな中、Xcode9 から **New Build System** という高速でビルドしてくれる機能が実装されていました。  
この設定を行うと、ビルドがかなり早くなります。  
安定感もあるのでビルド待ちのストレスも減少されると思います！

<br>

設定方法はとても簡単です。

`File` -> `Workspace Settings...` -> `Build System`

Workspaceから設定画面を開いて Build System を  
`New Build System (Preview)` に変えるだけ！  
（初期設定は `Standard Build System (Default)` となっています。）

<br>

オープンソースの [llbuild](https://github.com/apple/swift-llbuild) が使われているみたいです。  
現在はDefault設定にはなっておりませんが、今後のアップデートでデフォルトになるといいですね。

<br>

今後も快適なコーディングライフを送りたいですね:)

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