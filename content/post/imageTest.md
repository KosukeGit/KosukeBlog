+++
date = "2017-03-03"
title = "画像テスト"
description = ""
archives = "2017-03-03"

# URLの最後を好きな文字列に変更できる
slug = "test-image"

# Categoriesに表示される（なるべく少ない方がいい、あらかじめ決めてよく考える（例：リリース、メモ、言語別に分けたりなど））
categories = [
    "image"
]

# Tagsに表示される（似たものが重複しないように気をつける）
tags = [
    "image",
    "test",
]

keywords = [
    ""
]

# Homeで画像を表示させる
autoThumbnailImage = false
thumbnailImagePosition = "left"  # top, centerなどもあるので強調したい時はtopを使うなど使い分ける
thumbnailImage = "images/blog/2017-03-03/testImage.jpg"  # staticの階層

# 本文のタイトルの背景に画像を使用する
coverImage = "https://d1u9biwaxjngwg.cloudfront.net/welcome-to-tranquilpeak/city.jpg"  # URLのみ参照可
metaAlignment = "center"
#coverMeta = "out"  # 背景に文字を被せたくないときはoutにする
+++

{{< image src="/images/blog/2017-03-03/testImage.jpg" alt="近所で撮った写真" >}}

# Test IMAGE!!

image

<br>

alert test

{{< alert info no-icon >}}
Here is a danger alert without icon
{{< /alert >}}

- info
- success
- warning
- danger
- no-icon

{{< alert warning >}}
Here is a danger alert without icon
{{< /alert >}}


<br>


{{< hl-text danger >}}
your highlighted text
{{< /hl-text >}}

- red
- green
- blue
- purple
- orange
- yellow
- cyan
- primary
- success
- warning
- danger

{{< hl-text success >}}
your highlighted text
{{< /hl-text >}}

finished!


