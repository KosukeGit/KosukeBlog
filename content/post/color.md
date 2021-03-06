+++
date = "2017-07-31"
title = "Xcodeで色設定をするときの注意点"
slug = "color"
description = "XcodeでsRGB等の設定を行う方法"

categories = [
	"Editor",
	"Design"
]
tags = [
	"xcode",
	"storyboard"
]
archives = ""
keywords = [
	"Kosuke Blog",
	"こうすけブログ",
	"Xcode",
	"Storyboard",
	"color",
	"RGB",
	"Generic RGB",
	"sRGB"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2017-07-31/xcode.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

## Xcodeで色設定をするときの注意点

<br>

<br>

### 動機
Storyboardで設定した色とコードで書いた色の見た目が  
Build&Runして確認したときに微妙に違うなあと思い、  
調べたところ以下の設定が問題でした。

<br>

### 原因と解決方法
Xcode の色選択から **RGB Sliders** を選択し、  
右の歯車マークから **Color Profile** で確認したところ設定が異なっていたのが原因でした。  
そのため、自分の場合は `Generic RGB` -> `sRGB`に設定を変えて色を統一させました。

<br>

### おまけ
ちなみに正確な色の値を知りたい場合は  
こちらを使用すると見ることができます。  
`Spotlight検索` -> `Digital Color Meter`

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