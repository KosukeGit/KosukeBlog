+++
date = "2018-03-27"
title = "ページの指定した箇所に飛ぶURLの作り方"
slug = "url"
description = "ページの指定した箇所を開くためのURLの作り方"

categories = [
	"Tips"
]
tags = [
	"html"
]
archives = ""
keywords = [
	"Kosuke Blog",
	"こうすけブログ",
	"URL",
	"ページ指定",
	"html"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2018-03-27/url.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

html上でその部分の name や id タグの名前を  
URLの後ろに **#** をつけて記載すればページを開いた際にその部分を表示します。

<br>

例えば、以下のように作られていた場合には

```
<a name="hogehoge"></a>
```

 `https://~~~#hogehoge` としてあげると  
ページを開いた瞬間にhogehoge部分にスクロールします。

<br>

<br>

ちなみにデベロッパーツールを開く際は  
`command + option + I` で開くことが可能です。

<br>

解説ページの最後に参考URLなど載せる際に  
こういった気遣いができるとよいですね ;)

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