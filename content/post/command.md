+++
date = "2017-05-07"
title = "Gitのコマンド名を自分で設定する"
slug = "command"
description = "自分で設定したGitのコマンドを使えるようにする方法"

categories = [
	"Git"
]
tags = [
	"github",
	"terminal"
]
archives = ""
keywords = [
	"Kosuke Blog",
	"こうすけブログ",
	"Git",
	"GitHub",
	"ターミナル",
	"gitコマンド",
	"git config"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2017-05-07/GitCommand.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++


Gitコマンドが長くて打つのが大変、毎回調べなきゃいけない... そんなときに以下のような設定をすることによってGitのショートカットコマンドを作成することができます！

`--global` にすることで現在のユーザーを対象にした設定をすることができます。

<br>

##### エイリアス設定

```
git config --global alias.省略したいコマンド '実際のコマンド'
```

```
例：git config --global alias.st 'status'
```

<br>

##### 実行時

```
git st
```

これで git status した時と同じ動作をするようになります

<br>

##### 設定したエイリアス一覧表示

```
git config --global --list
```

<br>

##### 設定したコマンドを削除

```
git config --global --unset alias.st
```

これで  git st コマンドが削除されます

<br>

##### ヘルプ表示

```
git config help
```

<br>

参考URLは[こちら](https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases)

<br>

<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- BlogAdsense_Middle -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-9828180917254396"
     data-ad-slot="2239399852"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

<br>

### おまけ

<br>

##### 今日何をしたか振り返り（１２時間前からのログ表示）

```
git today
```

このコマンドで今日どんなコミットをしたか等振り返ることができます。

設定する際はこちら↓
```
git config --global alias.today "log --oneline --since='12 hours ago'"
```

<br>

##### ログをグラフで表示

```
git mylog
```

ターミナルでログをグラフにして確認する際に便利です。

設定する際はこちら↓

```
git config --global alias.mylog 'log --oneline --graph --decorate'
```

<br>

これでよく使うコマンドや長いコマンドの入力が楽になります。
何を設定したか確認したい時は、`--list`を使いましょう！

<br>

こちらの記事も合わせてどうぞ！

→ [tabキーでGitのコマンドを補完する](https://kosukeblog.com/2017/04/completion/)

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