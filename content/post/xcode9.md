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

Xcode8ではキーボードのCommandを押しながら定義をクリックすると、定義元に一発で飛ぶことができたが、Xcode9では新しい機能でどんなアクションをするかメニューが開き、から`Jump to Definition`を選択しないといけません。  
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