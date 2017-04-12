+++
date = "2017-04-12"
title = "bash-completion, git-completionの導入手順"
slug = "completion"
description = "bash補完拡張とgit補完"

tags = [
	"bash",
	"git",
	"terminal"
]
categories = [
	"Bash",
	"Git"
]
archives = ""
keywords = [
	"Kosuke Blog",
	"こうすけブログ",
	"bash",
	"bash-completion",
	"git",
	"git-completion",
	"ターミナル"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2017-04-12/terminal.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

今回は、bash-completion と git-completionの導入の手順を記していきます。

<br>

## bash-completion

bash-completionとは、Bashの補完機能を拡張するシェルスクリプトのことです。

##### インストール
```
$ brew install bash-completion
```

<br>

##### viコマンドで追加する
```
vi ~/.bash_profile
```

1. i（インサートモードに移行）
2. 以下を追加（[参考ページ](https://github.com/scop/bash-completion)）
3. escキー（インサートモードを解除）
4.  :wq（保存して終了）

```
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
```

<br>

## git-completion

git-completionとは、Gitコマンドの補完スクリプトのことです。

##### インストール

[ここ](https://github.com/git/git/blob/master/contrib/completion/git-completion.bash)からダウンロード

1. Rawを開いて中身をコピー
2. viコマンドで貼り付け
3. :w 名前（今回は、名前のところを git-completion.bash とする）をつけて終了

<br>

##### 実行する

作成した git-completion.bash をどこかのフォルダにいれる

（例：setting/git-completion.bash）

その後は以下を入力して、指定したスクリプトファイルを実行する
```
source ~/setting/git-completion.bash
```

<br>

これでターミナルでGitコマンドなどが入力途中で Tabキー を押すことによって最後まで自動で入力されて楽になります！