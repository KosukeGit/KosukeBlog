+++
date = "2018-04-25"
title = "pod install と pod update の違い"
slug = "podinstallandupdate"
description = "pod install と pod update のそれぞれの役割についてざっくり解説"

categories = [
	"Library"
]
tags = [
	"ios",
	"swift",
	"cocoapods",
	"terminal"
]
archives = ""
keywords = [
	"Kosuke Blog",
	"こうすけブログ",
	"pod install",
	"pod update",
	"CocoaPods",
	"iOS",
	"Swift", 
	"オープンソース",
	"ライブラリ"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2018-04-25/podinstallandupdate.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

pod install と pod update それぞれの役割についてざっくり解説していきます。

<br>

### pod install

1. Podfile.lockをみて更新する

<br>

<br>

### pod update

1. SDKの今出ているバージョン（最新のブランチ）を見て、その差分があったらバージョンを更新する
2. PodfileにSDKのバージョン指定をしているものは無視して、このバージョンから新しいのを使うなどといった指定がある場合には、そのSDKを更新する
3. Podfile.lockが更新される（アップデートしたSDKのバージョンが更新される）

<br>

<br>

#### pod update が終わらない方へアドバイス

容量が大きいため pod update をしてもなかなか終わらない、、という方に  
オススメなのが`outdated` コマンドと `--verbose` オプションです。

<br>

- **outdated**  
`outdated` コマンドを使うと、  
現在使っているライブラリが古いバージョンかどうか分かります。  
`pod update` としてしまうと、全てのライブラリをアップデートしようとして  
時間がかかるので、`outdated` コマンドで古いライブラリがわかったら  
`pod update 対象のLibrary名` というように  
特定のライブラリのみをアップデートするようにすると時間短縮になります。

<br>

- **--verbose**  
アップデートに時間がかかってしまい、本当に動いているのかどうか  
確認したいときは `pod update --verbose` のように  
`--verbose`オプションを使うとアップデート中に更新している際の情報が表示されます。

<br>

<br>

こちらの記事も合わせてどうぞ！  
[CocoaPodsについて](https://kosukeblog.com/2017/04/cocoapods/)

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