+++
date = "2017-04-13"
title = "CocoaPodsについて"
slug = "cocoapods"
description = "CocoaPodsの概要や導入手順について"

tags = [
	"CocoaPods",
	"iOS",
	"Swift",
]
categories = [
	"CocoaPods"
]
archives = ""
keywords = [
	"Kosuke Blog",
	"こうすけブログ",
	"CocoaPods",
	"iOS",
	"Swift", 
	"オープンソース",
	"ライブラリ"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2017-04-13/CocoaPods.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

## [CocoaPods](https://cocoapods.org/)

オープンソースなどのライブラリを使用した際にバージョン管理を行うことができるiOSライブラリ管理ツール

<br>

##### インストール

CocoaPods をインストールする

```
sudo gem install cocoapods
```

<br>

##### Podfileの生成

Podfile が入ってない場合は、一番最初に使用したいディレクトリで以下のコマンドを入力するとPodfileが生成される
（この中にライブラリなどを追加していく）

```
pod init
```

<br>

##### Workspace等の生成

pod install を行うとその中に以下のファイル等が生成される

- アプリ名.xcworkspace
- Podfile.lock
- Podsフォルダ

```
pod install
```

<br>

##### podのバージョンを更新する

podのバージョンをあげる際に以下のコマンドを使用する

```
pod update
```

<br>

##### 編集

バージョンの書き換えなどを行う際に使用する
```
vi Podfile
```

{{< alert danger >}}
最後に **pod install** をしないと反映されないので注意
{{< /alert >}}

<br>

##### ファイル内の確認

podファイルの中を確認する

```
cat Podfile
```

<br>

##### 古いバージョンの検出


使用しているライブラリの中から古いバージョンを検出してくれる

```
pod outbated
```

<br>

##### コマンドのヘルプ

コマンドを忘れた際に使用する

```
pod --help
```

<br>

使用する際には アプリ名.xcworkspace を開いて、その中に使うライブラリのインポート行う必要があります。

また、多数のライブラリ等がまとまった [Awesome Swift](https://github.com/matteocrippa/awesome-swift) はおすすめです。ここから使いたいものを探してみるといいかもしれません。