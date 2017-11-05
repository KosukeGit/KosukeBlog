+++
date = "2017-11-06"
title = "Equatableについて"
slug = "equatable"
description = "SwiftのEquatableの使い方の説明"

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
	"Equatable",
	"Equatableとは"
]

autoThumbnailImage = false
thumbnailImagePosition = "left"
thumbnailImage = "images/blog/2017-11-06/swift.png"

coverImage = "https://goo.gl/photos/D3dunwY36egKs3GHA"
metaAlignment = "center"
+++

## Equatable

Equatableプロトコルに準拠したクラスは  
`static func ==(lhs: Self, rhs: Self) -> Bool` 関数を実装する必要があり、  
何によって等しいかをこの中で定義してあげることで比較ができるようになります。

<br>

{{< codeblock "EquatableSample.swift" "swift" >}}
class IntegerRef: Equatable {
    let value: Int
    init(_ value: Int) {
        self.value = value
    }

    static func == (lhs: IntegerRef, rhs: IntegerRef) -> Bool {
        return lhs.value == rhs.value
    }
}
{{< /codeblock >}}

参考：https://developer.apple.com/documentation/swift/equatable

<br>

これにより、`IntegerRef(10) == IntegerRef(10)` は `true` となります。  
よって、以下のようなテストコードは通るようになります。

<br>

{{< codeblock "EquatableSample.swift" "swift" >}}
func testEquality() {
    XCTAssertTrue(IntegerRef(10) == IntegerRef(10))
    XCTAssertFalse(IntegerRef(10) == IntegerRef(11))
}
{{< /codeblock >}}

<br>

<br>

### どう使うのか

自作クラスのArrayもEquatableプロトコルに準拠していれば`contains()` を用いた際に、  
配列の中に指定したオブジェクトが存在しているかを確認できます。

<br>

上記の例を用いて、書くとこのようになります。

{{< codeblock "EquatableSample.swift" "swift" >}}
let array = [IntegerRef(10), IntegerRef(11), IntegerRef(12)]

array.contains(IntegerRef(10))  // => true
array.contains(IntegerRef(13))  // => false
{{< /codeblock >}}

<br>

<br>

### さらに便利に使う

{{< codeblock "EquatableSample.swift" "swift" >}}
/// 重複した要素を削除するArray型の拡張
extension Array where Element: Equatable {
    var unique: [Element] {
        return reduce([], {
            $0.contains($1) ? $0 : $0 + [$1]
        })
    }
}

let array = [IntegerRef(10), IntegerRef(11), IntegerRef(12), IntegerRef(11)]
print(array)  // [IntegerRef(10), IntegerRef(11), IntegerRef(12), IntegerRef(11)]
print(array.unique)  // [IntegerRef(10), IntegerRef(11), IntegerRef(12)]
{{< /codeblock >}}

上記のようにArrayを拡張してあげれば、配列の重複を防ぐことが可能になります。

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