//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

import Extension
import FlexUI

let flexView = View()
    .backgroundColor(.gray)
    .top(0)
    .left(5)
    .width(200)
    .height(300)
    .flexDirection(.column)
    .flexWrap(.wrap)
    .children([
        Text()
            .backgroundColor(.orange)
            .left(10)
            .width(80%)
            .height(30)
            .flexGrow(1)
            .content(Text.testAttrbuteString),
        Image()
            .backgroundColor(.yellow)
            .width(50)
            .aspectRatio(1)
            .content("https://avatars1.githubusercontent.com/u/6511522"),
        Button()
            .backgroundColor(.burlywood)
            .width(50)
            .aspectRatio(2)
            .content({
                print("button clicked")
            })
    ])
    
flexView.layout.calculateLayout()
flexView.recursiveSyncFrame()
