+++
date = "2017-05-05"
title = "GitHubの２段階認証後にpushできなくなった時の対処法"
slug = "authentication"
description = "GitHubの２段階認証後にpushできなくなった時の対処法"

categories = [
	"Git"
]
tags = [
	"gitHub",
	"authentication"
]
archives = ""
keywords = [
	"Kosuke Blog",
	"こうすけブログ",
	"GitHub",
	"Authentication",
	"２段階認証", 
	"対処法"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2017-05-05/GitHub.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

今回は、GitHubで２段階認証を行ったが、その後のpushができなくなってしまった際の対応方法について書いていきたいと思います。

下記の様にプッシュ後にユーザ名とパスワードを求められて、入力すると

```fatal: Authentication failed for 'https://github.com/~~~'```

と出力されてしまいました。

<br>

この対応方法は、アクセストークンを生成する必要があります。
公式ページに従って手順通りに行えば解決できます。

[Creating a token](
https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)

まず、上記のURLの手順に従ってアクセストークンを発行します。
このアクセストークンはどこかにメモをしておきましょう。

そして、ユーザ名とパスワードを入力する際のパスワードに先ほどのアクセストークンを入れて進めることでプッシュすることができます。

ちなみに、キーチェーン等の確認をする際はこちらを参考にすると良いです。

[Updating your credentials via Keychain Access](https://help.github.com/articles/updating-credentials-from-the-osx-keychain/)