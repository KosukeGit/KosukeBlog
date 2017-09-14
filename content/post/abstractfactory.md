+++
date = "2017-09-15"
title = "Abstract Factory パターンについて"
slug = "abstractfactory"
description = "SwiftでAbstract Factory パターンを使った簡単な例"

tags = [
	"ios",
	"design patterns"
]
categories = [
	"Swift"
]
archives = ""
keywords = [
	"Kosuke Blog",
	"こうすけブログ",
	"Swift",
	"Design Patterns",
	"Abstract Factory パターン"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2017-09-15/swift.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

## Abstract Factory パターンとは
デザインパターンの1つで、関連するオブジェクトの生成を行うクラスを抽象的にして、生成を行うためのインターフェースを提供する。  

インスタンスを生成するためのAPIを集約することにより、情報隠蔽や複数のモジュールの再利用を効率よく行うことが可能になる。  

<br>

<br>

### 実装例

```
import UIKit



/// Abstract Factory パターン ----------------------------------------

/// Productクラス（製品）
protocol Doll {
    func sayHallo()
}

/// Creatorクラス（工場）
protocol Factory {
    func createInstance() -> Doll
}

/// ConcreteProductクラス（Japanese製品）
class JapaneseDoll: Doll {
    func sayHallo() {
        print("こんにちは")
    }
}

/// ConcreteProductクラス（America製品）
class AmericanDoll: Doll {
    func sayHallo() {
        print("Hallo")
    }
}

/// ConcreteCreatorクラス（Chinese製品）
class ChineseDoll: Doll {
    func sayHallo() {
        print("你好")
    }
}

/// Abstract Factory（XXのConcreteCreatorクラス（XX製品を作るXX工場）を作るFactoryメソッド）
enum Country {
    case Japan
    case America
    case China
}

enum DollFactory {
    static func create(from country: Country) -> Doll {
        switch country {
        case .Japan:
            return JapaneseDoll()
        case .America:
            return AmericanDoll()
        case .China:
            return ChineseDoll()
        }
    }
}



/// 呼び出す ------------------------------------------------------------

class ViewController: UIViewController {
    
    var doll: Doll { return DollFactory.create(from: .Japan) }  // 例えば .Japan を .America に変えるだけでAmericanDollのインスタンスが生成できる
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doll.sayHallo()
    }
}
```

<br>

Abstract FactoryでDollオブジェクトをインスタンス化する役割を持つ。  
そのため、呼び出し側で生成されるインスタンスのことを意識しなくて済む（状況が変わっても修正箇所は微量且つ呼び出す側のコードに影響がない）