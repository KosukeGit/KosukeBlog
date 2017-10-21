+++
date = "2017-05-06"
title = "いいねやツイートボタンのURLまとめ"
slug = "button"
description = "自分のブログにいいねボタンやツイートボタンを表示させるURLのまとめ"

categories = [
	"Blog"
]
tags = [
	"profile",
	"html"
]
archives = ""
keywords = [
	"Kosuke Blog",
	"こうすけブログ",
	"ブログ",
	"ボタン設置",
	"いいねボタン",
	"ツイートボタン",
	"Twitter",
	"はてブ",
	"Facebook",
	"Google+",
	"Pocket",
	"LINE",
	"feedly",
	"Evernote",
	"Tumblr",
	"mixi"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2017-05-06/button.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

自分のブログに、いいねや記事をシェアしてもらうためのボタンのURLをまとめました。

[Twitter](https://about.twitter.com/ja/resources/buttons#tweet)

[はてブ](http://b.hatena.ne.jp/guide/bbutton)

[Facebook](https://developers.facebook.com/docs/plugins/like-button?locale=ja_JP#)

[Google+](https://developers.google.com/+/web/+1button/)

[Pocket](https://getpocket.com/publisher/button)

[LINE](https://media.line.me/ja/how_to_install#lineitbutton)

[feedly](https://feedly.com/factory.html)

[Evernote](https://dev.evernote.com/sitememory/#a_builder)　※廃止のため、現在は [Web Clipper](https://evernote.com/intl/jp/webclipper/) を用いる

[Tumblr](https://www.tumblr.com/buttons)

[mixi](http://developer.mixi.co.jp/connect/mixi_plugin/mixi_check/spec_mixi_check/)

<br>

Facebookのいいねボタンは普通に配置しただけでは少し下にずれてしまうことがあるので、htmlで書く場合は

`style="line-height:0;"`

の記述をタグの中にすると他のボタンと同じ高さになります。

また、Google+ や Pocket は右側に空白ができてしまうため、気になる場合は横幅(width)を調節してあげると良いと思います。