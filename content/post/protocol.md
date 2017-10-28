+++
date = "2017-09-15"
title = "Swift プロトコル、デリゲートについて理解する"
slug = "protocol"
description = "Swiftで使用するプロトコルやデリゲートについて解説"

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
	"Protocol",
	"Delegate",
	"基礎"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2017-09-15/swift.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

プロトコルやデリゲートの使い方などの基礎を初心にかえって勉強し直してみました。  
Swiftのプロトコルは、Javaでいうインターフェースのことです。  
Swiftのプロトコルだけで学ぼうとすると、少々わかりづらいかもしれないので、  
Javaのインターフェースを先に調べてみてからだと、より理解しやすいかと思います。

<br>

また、本記事ではステップごとに分けて実際のプログラムで解説してきます。  
~~決して手抜き解説なわけではありません。~~

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

##### Step 1-1

{{< codeblock "Step1_1.swift" "swift" >}}
import Foundation

/// クラスがカートを持つ上で、カートに必要な要素をここで定義する
/// ちなみにプロトコルはただのお約束という意味なので
/// 必ずしもDelegateと名付ける必要はない
protocol KartDelegate {
    func setPerformance()  // 性能
    func setColor()  // 車の色
}
{{< /codeblock >}}

##### Step 1-2

{{< codeblock "Step1_2.swift" "swift" >}}
import Foundation

/// カートプロトコル
protocol KartDelegate {
    func setPerformance()  // 性能
    func setColor()  // 車の色
}

/// マリオクラスがカートを持つ
class Mario: KartDelegate {
    
    /// カートを持ったクラスは、そのカートプロトコルの中で定義した抽象メソッドを
    /// 必ず実装（implements）してあげる必要がある
    func setPerformance() {
        print("☆☆☆☆☆")
    }
    func setColor() {
        print("Red")
    }
}
{{< /codeblock >}}

##### Step 1-3

{{< codeblock "Step1_3.swift" "swift" >}}
import Foundation

/// クラスがカートを持つ上で、カートに必要な要素をここで定義する
protocol KartDelegate {
    func setPerformance()  // 性能
    func setColor()  // 車の色
}

/// マリオクラス
class Mario {
    /// どんなカートを持つかわからないがKartDelegateのプロパティを持つ
    var delegate: KartDelegate?
    
    func myKart() {
        /// まだどんなカートを持っているかわからないがここで呼び出してみる
        delegate?.setPerformance()
        delegate?.setColor()
    }
}

/// ルイージクラス
class Luigi: KartDelegate {
    
    func setPerformance() {
        print("☆☆")
    }
    func setColor() {
        print("Green")
    }
}

/// クラスのインスタンスを作る
let mario = Mario()
let luigi = Luigi()
/// ここでマリオがdelegateを通じてルイージのカートを持つ
mario.delegate = luigi
mario.myKart()  // ☆☆ Green
{{< /codeblock >}}

<br>

<br>

### 実際に使用する例

iOSアプリを開発している方で、tabelViewやtextFieldなどを利用する際に  
どこかの記事の通り書いて、知らぬ間にクラスに`~~~Delegate`を継承して、
プロトコルの関数を使用していた、、なんて経験があるかもしれません。

ここまででプロトコル等について理解できてきたなら  
下記の例を見れば、より理解が深まるかもしれません。

<br>

##### Step 2-1

{{< codeblock "Step2_1.swift" "swift" >}}
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {  // UITextFieldDelegateのプロトコルを継承する
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self  // command + クリック で delegate の中身を見ると
                                   // weak open var delegate: UITextFieldDelegate? が定義されているのがわかる。
                                   // また、このクラス内でプロトコルの関数の中身の実装をしており、
                                   // その関数を扱いたいため self をデリゲートに指定してある。
                                   // ちなみに、定義元が optional public func ~~ のように optional が付いているものは
                                   // 必ずしもプロトコルの関数を実装（implements）する必要はない。
    }
    
    /// デリゲートをselfにしてあるので、この中にUITextFieldDelegateの関数を記述する
    /// Returnボタン後にキーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
{{< /codeblock >}}

##### Step 2-2

{{< codeblock "Step2_2.swift" "swift" >}}
/// このように外でUITextFieldDelegateを継承して、実装したプロトコルの関数を
/// デリゲートで指定してあげればViewControllerで使うこともできる。
/// しかし、この方法を用いる場合はクラスのインスタンスが破棄されると扱えなくなるので注意が必要です。

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    let vc2 = ViewController2()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = vc2
    }
}

class ViewController2: UIViewController, UITextFieldDelegate {
    /// Returnボタン後にキーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
{{< /codeblock >}}

 
コードを書く際に、まず動かそうと真似て書いて、  
なんとなく理解した気になっていたことが度々ありましたが、  
こうして改めてステップごとにわけて書いてみると自分でもより理解を深めることができました。:)

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