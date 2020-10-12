![Release](https://img.shields.io/github/release/DingSoung/FlexUI.svg)
![Status](https://travis-ci.org/DingSoung/FlexUI.svg?branch=master)

![SwiftPackage](https://img.shields.io/badge/SwiftPackage-compatible-E66848.svg?style=flat)

![Language](https://img.shields.io/badge/Swift-5-FFAC45.svg?style=flat)

[![Donate](https://img.shields.io/badge/Donate-PayPal-9EA59D.svg)](https://paypal.me/DingSongwen)

一个 UI 开发工具

# 安装

Swift Package Manager

```swift
https://github.com/DingSoung/FlexUI master
```

# 使用 

UIKit 的写法

```swift
let view = UIVIew()
view.backgroundColor = .gray
view.frame = CGReact(0, 5, 200, 300)

let text = UILabel()
text.backgroundColor = .orange
text.attrbuteText = ...
text.frame = CGReact(10, 0, 200 * 0.8, 30)
view.addSubView(text)

...

func layoutSubViews() {
    view.frame = ....
    text.frame = ...
}
```

FlexUI的写法


```swift
let flexView = View()
    .backgroundColor(.gray)
    .top(0)
    .left(5)
    .width(200)
    .height(300)
    .children([
        Text()
            .backgroundColor(.orange)
            .left(10)
            .width(80%)
            .height(30)
            .flexGrow(1)
            .content(Text.testAttrbuteString),
    ])

flexView.layout.calculateLayout()
flexView.recursiveSyncFrame()
```

更多用法请参考 playground
