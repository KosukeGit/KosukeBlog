+++
date = "2017-06-30"
title = "Xcode空白の設定 + 小ネタ"
slug = "whitespace"
description = "Xcodeで空白の設定をする + GitHub小ネタ"

categories = [
	"Editor",
	"Tips"
]
tags = [
	"ios",
	"xcode",
	"github"
]
archives = ""
keywords = [
	"Kosuke Blog",
	"こうすけブログ",
	"GitHub",
	"Xcode",
	"ios",
	"小ネタ"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2017-06-29/xcode.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

## Xcodeで空白の設定をする + 小ネタ

Info.plistをコードの状態にして一部修正を加えた際、空白の種類が異なってしまっていたのでメモ。

<br>

<br>

Xcode -> Preferences... -> Text Editing を選択  
その中にある項目の Indentation の Prefer indent using を押すと

- **Spaces**
- **Tabs**

の２種類が選択できる。

上記の2種類からどちらかで統一し、文字をコピペし直すと自動的に空白を指定した方の設定で補ってくれます。

<br>

##### 空白を目で確認する方法

Xcodeの上のメニューから `Editor` -> `Show Invisibles`

<br>

### 小ネタ

`?w=1`をGitHubのリンクの後ろに付けると空白の差分を除いた状態になるためレビューしやすくなります！試して見てください:)

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