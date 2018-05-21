+++
date = "2018-05-22"
title = "【Swift】for と forEach の書き方メモ"
slug = "forforeach"
description = "for と forEach それぞれの書き方についてメモ"

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
	"for",
	"foreach",
	"メモ"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2018-05-22/swift.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

forEachばかり使っていたらforの書き方を忘れてしまったので簡単にメモしました。

<br>

```
for i in 0..<10 {
    print(i)  // 0~9
}

for i in (0..<10).reversed() {
    print(i)  // 9~0
}


let arr = ["a", "b", "c"]

for i in 0..<arr.count {
    print(arr[i])  // a, b, c
}

for i in arr {
    print(i)  // a, b, c
}

arr.forEach {
    print($0)  // a, b, c
}

Array(0..<arr.count).forEach {
    print(arr[$0])  // a, b, c
}
```

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