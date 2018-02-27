+++
date = "2018-02-28"
title = "GitHubへのアクセスエラーでpod updateできない"
slug = "podupdate"
description = "GitHubへのアクセスエラーでpod updateができない時の原因と対処法"

categories = [
	"Library"
]
tags = [
	"terminal",
	"cocoapods",
	"github"
]
archives = ""
keywords = [
	"Kosuke Blog",
	"こうすけブログ",
	"CocoaPods",
	"pod update",
	"OpenSSL",
	"Ruby"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2018-02-28/podupdate.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

### pod updateできない

最近 `pod update` コマンドが急に効かなくなったため、  
とりあえず`~/.cocoapods/repos/master`を削除して入れ直してみました。

```
pod repo remove master
pod setup
pod install
```

<br>

それでも以下のようなエラーが出る。。。

```
pod update

[!] Failed to connect to GitHub to update the CocoaPods/Specs specs repo - Please check if you are offline, or that GitHub is down
```

原因を調べて見たところこのような変更がありました。

<br>

>Earlier today we permanently removed support for the following weak cryptographic standards on github.com and api.github.com

以下のURLに詳細が載っています。
[Weak cryptographic standards removed](https://github.com/blog/2507-weak-cryptographic-standards-removed)

<br>

これらからわかったことは、デフォルトで入っているOpenSSLのバージョンが  
今回の変更に対し、対応されていないことがわかりました。

OpenSSLをアップデート後は参照させるためにRuby、またCocoaPodsも忘れず更新/インストールしましょう。

<br>

こちらも合わせてどうぞ！
[OpenSSLの更新のメモ](https://kosukeblog.com/2018/02/openssl/)

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