+++
date = "2017-08-13"
title = "Developer Enterprise Program を使ってアプリ配布したときのまとめ"
slug = "inhouse"
description = "OTA形式(In-House)でアプリ配布をした際の手順メモ"

tags = [
	"ios"
]
categories = [
	"Xcode"
]
archives = ""
keywords = [
	"Kosuke Blog",
	"こうすけブログ",
	"Swift",
	"ios",
	"Xcode",
	"In-House",
	"OTA",
	"Developer Enterprise Program",
	"Apple",
	"アプリ配布"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2017-08-13/xcode.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

本記事は、In-House形式によるiOSアプリの配布方法です。  
ダウンロードできるデバイスをこちらで登録する必要なく、台数無制限でアプリを入れることが可能です。

<br>

# Developer Enterprise Program 配布までの流れ

<br>

<br>

##### ① Archives
端末を Generic iOS Device にして `Product` -> `Archives`

<br>

##### ② ipaファイルの生成
Export で ipa ファイルを作る

- アプリの名前（Xcode側で設定したアイコン名はアプリをインストールしている時に表示される時に表示される名前）
- ダウンロードページからダウンロードを押した時にダウンロードされるipaファイルのURL  
例: `https://ダウンロードページ/アプリ名.ipa`  
（plistファイルからこのURLを参照してダウンロードさせるのに使用）
- image URL ×2 (大小)

<br>

具体例は下記に記載してある *GitHubでダウンロードページを動かす* を参照

<br>

[参考URL - Apple公式ページ](https://developer.apple.com/jp/documentation/IDEs/Conceptual/AppDistributionGuide/DistributingEnterpriseProgramApps/DistributingEnterpriseProgramApps.html)

<br>

##### ③ ダウンロードページを作る  
ダウンロードボタンを押したときに手順2で生成されるplistファイルをここで読みこませる  
例: `https://ダウンロードページ/manifest.plist`

<br><br>

例: ダウンロードページのHTML
```
<!DOCTYPE html>
<html lang="ja">

<head>
    <title>ダウンロードページ</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>

    <h1>ダウンロード</h1>

    <img src="./image/icon512.png" alt="アプリアイコン">
    <p>下のボタンからアプリをダウンロードしてください。</p>

    <a href="itms-services://?action=download-manifest&url=manifest.plistが置いてあるURL" target="_blank">ダウンロード</a>

</body>
</html>
```

Export時に`ipaファイル`と`plistファイル`が生成されるため、  
`itms-services://?action=download-manifest&url=`の後に  
生成したplistファイルの置いてあるURLを指定します。

例: `<a href="itms-services://?action=download-manifest&url=https://ユーザ名.github.io/アプリ名/download/apps/v1_0_0/manifest.plist" target="_blank">ダウンロード</a>`

<br>

<br>

##### GitHubでダウンロードページを動かす

ページにアクセスできるようにするための具体例として、  
GitHubでダウンロードする静的ページを作り、
同一階層にipa, plistファイルを置くという方法があります。

<br>

例: GitHub構成

```
アプリ名 - download  / - apps  /  v1_0_0  /  - アプリ名.ipa
                                           - manifest.plist
                     - image /  - icon512.png
                                - icon57.png
                     - index.html
                     - style.css
       - README.md
       - .gitignore
       - LICENSE
```

リポジトリ内をこのようなファイル構成にしておき、  
githubで静的サイトを作り、  URLを生成すると  
XcodeでExportする際に必要なURLが以下のようになります。

- https://ユーザ名.github.io/アプリ名/download/apps/v1_0_0/アプリ名.ipa
- https://ユーザ名.github.io/アプリ名/download/image/icon57.png
- https://ユーザ名.github.io/アプリ名/download/image/icon512.png

<br>

これであとは、手持ちの端末からサイトにアクセスして  
`ダウンロード完了` -> `設定` -> `プロファイルとデバイス管理` を選択し、  
エンタープライズAPPにある項目から該当するアプリ開発者を選び、`信頼`を選択する。  
これで、利用できるようになります。