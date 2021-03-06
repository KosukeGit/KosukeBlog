+++
date = "2018-02-28"
title = "OpenSSLのバージョンを更新する"
slug = "openssl"
description = "OpenSSLのバージョンを更新した時の手順メモ"

categories = [
	"Library"
]
tags = [
	"terminal"
]
archives = ""
keywords = [
	"Kosuke Blog",
	"こうすけブログ",
	"OpenSSL"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2018-02-28/openssl.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

OpenSSLのバージョンを更新した際のメモです。

<br>

`brew upgrade openssl` -> openssl 1.0.2n already installed  
`openssl version` -> OpenSSL 0.9.8zh 14 Jan 2016

上記からopensslの最新版のインストールはできているのに、最新ではないことがわかる。

<br>

##### パスをチェックする

`which openssl` -> /usr/bin/openssl  
`brew list openssl`

```
/usr/local/Cellar/openssl/1.0.2n/.bottle/etc/ (8 files)
/usr/local/Cellar/openssl/1.0.2n/bin/c_rehash
/usr/local/Cellar/openssl/1.0.2n/bin/openssl  -> これ
/usr/local/Cellar/openssl/1.0.2n/include/openssl/ (75 files)
/usr/local/Cellar/openssl/1.0.2n/lib/libcrypto.1.0.0.dylib
/usr/local/Cellar/openssl/1.0.2n/lib/libssl.1.0.0.dylib
/usr/local/Cellar/openssl/1.0.2n/lib/engines/ (12 files)
/usr/local/Cellar/openssl/1.0.2n/lib/pkgconfig/ (3 files)
/usr/local/Cellar/openssl/1.0.2n/lib/ (4 other files)
/usr/local/Cellar/openssl/1.0.2n/share/man/ (1680 files)
```

リストから表示されている  
`/usr/local/Cellar/openssl/1.0.2n/bin/openssl` に  
パスを通すために以下を入力する。

`echo "export PATH=/usr/local/Cellar/openssl/1.0.2n/bin:$PATH" >> ~/.bash_profile`  
`source ~/.bash_profile`

<br>

##### パスとバージョンを確認

`which openssl` -> /usr/local/Cellar/openssl/1.0.2n/bin/openssl  
`openssl version` -> OpenSSL 1.0.2n  7 Dec 2017

結果から最新になったことが確認できました！

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
</script>  