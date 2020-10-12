//
//  VIew.swift
//  FlexComponent
//
//  Created by 丁松文 on 2020/7/14.
//  Copyright © 2020 Songwen Ding. All rights reserved.
//

import Extension
import FlexLayout

extension View {
    @discardableResult public func direction        (_ value: FlexLayout.Direction) -> Self { layout.direction          = value; return self }
    @discardableResult public func flexDirection    (_ value: FlexLayout.FlexDirection) -> Self { layout.flexDirection  = value; return self }
    @discardableResult public func justifyContent   (_ value: FlexLayout.Justify) -> Self { layout.justifyContent   = value; return self }
    @discardableResult public func alignContent     (_ value: FlexLayout.Align) -> Self { layout.alignContent       = value; return self }
    @discardableResult public func alignItems       (_ value: FlexLayout.Align) -> Self { layout.alignItems         = value; return self }
    @discardableResult public func alignSelf        (_ value: FlexLayout.Align) -> Self { layout.alignSelf          = value; return self }
    @discardableResult public func position         (_ value: FlexLayout.Position) -> Self { layout.position        = value; return self }
    @discardableResult public func flexWrap         (_ value: FlexLayout.Wrap) -> Self { layout.flexWrap        = value; return self }
    @discardableResult public func overflow         (_ value: FlexLayout.Overflow) -> Self { layout.overflow    = value; return self }
    @discardableResult public func display          (_ value: FlexLayout.Display) -> Self { layout.display      = value; return self }
    @discardableResult public func flex             (_ value: Float) -> Self { layout.flex               = value; return self }
    @discardableResult public func flexGrow         (_ value: Float) -> Self { layout.flexGrow           = value; return self }
    @discardableResult public func flexShrink       (_ value: Float) -> Self { layout.flexShrink         = value; return self }
    @discardableResult public func flexBasis        (_ value: FlexLayout.Value) -> Self { layout.flexBasis          = value; return self }
    //position
    @discardableResult public func left             (_ value: FlexLayout.Value) -> Self { layout.left               = value; return self }
    @discardableResult public func top              (_ value: FlexLayout.Value) -> Self { layout.top                = value; return self }
    @discardableResult public func right            (_ value: FlexLayout.Value) -> Self { layout.right              = value; return self }
    @discardableResult public func bottom           (_ value: FlexLayout.Value) -> Self { layout.bottom             = value; return self }
    @discardableResult public func start            (_ value: FlexLayout.Value) -> Self { layout.start              = value; return self }
    @discardableResult public func end              (_ value: FlexLayout.Value) -> Self { layout.end                = value; return self }
    //margin
    @discardableResult public func marginLeft       (_ value: FlexLayout.Value) -> Self { layout.marginLeft         = value; return self }
    @discardableResult public func marginTop        (_ value: FlexLayout.Value) -> Self { layout.marginTop          = value; return self }
    @discardableResult public func marginRight      (_ value: FlexLayout.Value) -> Self { layout.marginRight        = value; return self }
    @discardableResult public func marginBottom     (_ value: FlexLayout.Value) -> Self { layout.marginBottom       = value; return self }
    @discardableResult public func marginStart      (_ value: FlexLayout.Value) -> Self { layout.marginStart        = value; return self }
    @discardableResult public func marginEnd        (_ value: FlexLayout.Value) -> Self { layout.marginEnd          = value; return self }
    @discardableResult public func marginHorizontal (_ value: FlexLayout.Value) -> Self { layout.marginHorizontal   = value; return self }
    @discardableResult public func marginVertical   (_ value: FlexLayout.Value) -> Self { layout.marginVertical     = value; return self }
    @discardableResult public func margin           (_ value: FlexLayout.Value) -> Self { layout.margin             = value; return self }
    //padding
    @discardableResult public func paddingLeft      (_ value: FlexLayout.Value) -> Self { layout.paddingLeft        = value; return self }
    @discardableResult public func paddingTop       (_ value: FlexLayout.Value) -> Self { layout.paddingTop         = value; return self }
    @discardableResult public func paddingRight     (_ value: FlexLayout.Value) -> Self { layout.paddingRight       = value; return self }
    @discardableResult public func paddingBottom    (_ value: FlexLayout.Value) -> Self { layout.paddingBottom      = value; return self }
    @discardableResult public func paddingStart     (_ value: FlexLayout.Value) -> Self { layout.paddingStart       = value; return self }
    @discardableResult public func paddingEnd       (_ value: FlexLayout.Value) -> Self { layout.paddingEnd         = value; return self }
    @discardableResult public func paddingHorizontal(_ value: FlexLayout.Value) -> Self { layout.paddingHorizontal  = value; return self }
    @discardableResult public func paddingVertical  (_ value: FlexLayout.Value) -> Self { layout.paddingVertical    = value; return self }
    @discardableResult public func padding          (_ value: FlexLayout.Value) -> Self { layout.padding            = value; return self }
    // border
    @discardableResult public func borderLeftWidth  (_ value: Float) -> Self { layout.borderLeftWidth    = value; return self }
    @discardableResult public func borderTopWidth   (_ value: Float) -> Self { layout.borderTopWidth     = value; return self }
    @discardableResult public func borderRightWidth (_ value: Float) -> Self { layout.borderRightWidth   = value; return self }
    @discardableResult public func borderBottomWidth(_ value: Float) -> Self { layout.borderBottomWidth  = value; return self }
    @discardableResult public func borderStartWidth (_ value: Float) -> Self { layout.borderStartWidth   = value; return self }
    @discardableResult public func borderEndWidth   (_ value: Float) -> Self { layout.borderEndWidth     = value; return self }
    @discardableResult public func borderWidth      (_ value: Float) -> Self { layout.borderWidth        = value; return self }
    // width height
    @discardableResult public func width            (_ value: FlexLayout.Value) -> Self { layout.width              = value; return self }
    @discardableResult public func height           (_ value: FlexLayout.Value) -> Self { layout.height             = value; return self }
    @discardableResult public func minWidth         (_ value: FlexLayout.Value) -> Self { layout.minWidth           = value; return self }
    @discardableResult public func minHeight        (_ value: FlexLayout.Value) -> Self { layout.minHeight          = value; return self }
    @discardableResult public func maxWidth         (_ value: FlexLayout.Value) -> Self { layout.maxWidth           = value; return self }
    @discardableResult public func maxHeight        (_ value: FlexLayout.Value) -> Self { layout.maxHeight          = value; return self }
    @discardableResult public func aspectRatio      (_ value: Float) -> Self { layout.aspectRatio        = value; return self }
}

extension View {
    @discardableResult open func children(_ children: [View]) -> Self {
        assert(subviews.count == 0, "current node not empty")
        children.forEach { child in
            addSubview(child)
        }
        layout.set(children: children.map { $0.layout })
        return self
    }
}
