+++
date = "2017-12-16"
title = "viewWillAppearやviewDidAppearなどの状態まとめ"
slug = "lifecycle"
description = "UIViewControllerのライフサイクルについてまとめ"

categories = [
	"Programming"
]
tags = [
	"ios",
	"swift"
]
archives = ""
keywords = [
	"Kosuke Blog",
	"こうすけブログ",
	"Swift",
	"ios",
	"UIViewController",
	"viewDidLoad",
	"viewWillAppear",
	"viewDidAppear",
	"基礎"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2017-12-16/swift.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

viewWillAppearの呼ばれるタイミングなど忘れることが多いので  
簡易的ですが、覚え方も一緒にまとめてみました。

<br>

<br>

##### 覚え方

例えば、View1 -> View2 にプッシュ遷移した場合、  
View1 の上に View2 が重なっている。この時の状態は...

<br>

- `View1`: disappearになった  
- `View2`: appearになった

<br>

なので以下のように覚えると楽です。

<br>

- `appear`: 画面が見えてる状態  
- `disappear`: 画面が見えなくなった状態

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

## まとめ

<br>

##### 起動時

1 `View1`: **viewDidLoad**  
2 `View1`: **viewWillAppear**  
3 `View1`: **viewDidAppear**

<br>

##### View1 -> View2 遷移する

1 `View2`: **viewDidLoad**  
2 `View1`: **viewWillDisappear**  
3 `View2`: **viewWillAppear**  
4 `View1`: **viewDidDisappear**  
5 `View2`: **viewDidAppear**

<br>

##### View2 -> View1 戻る (dismiss)

1 `View2`: **viewWillDisappear**  
2 `View1`: **viewWillAppear**  
3 `View2`: **viewDidDisappear**  
4 `View1`: **viewDidAppear**

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