//
//  FlexData.swift
//  FlexComponent
//
//  Created by 丁松文 on 2019/11/20.
//  Copyright © 2019 Songwen Ding. All rights reserved.
//

import UIKit
import Extension
import FlexLayout
import SwiftyMarkdown

// MARK: - dynamic create tree
public class FlexData {
    enum Tag: String {
        case view
        case text
        case image
        case button
    }
    let tag: Tag
    let layout: [String: String]
    let style: [String: String]
    let content: String
    let children: [FlexData]
    init(tag: Tag,
         layout: [String: String],
         style: [String: String],
         content: String,
         children: [FlexData]) {
        self.tag = tag
        self.layout = layout
        self.style = style
        self.content = content
        self.children = children
    }
}

extension FlexData {
    public convenience init(_ dictionary: [String: Any]) {
        let tagRawValue = dictionary["tag"] as? String ?? "view"
        let tag: Tag = FlexData.Tag(rawValue: tagRawValue) ?? .view
        let layout: [String: String]
        if let layoutString = dictionary["layout"] as? String,
            let map = Self.map(cssString: layoutString) {
            layout = map
        } else {
            layout = [:]
        }
        let style: [String: String]
        if let layoutString = dictionary["style"] as? String,
            let map = Self.map(cssString: layoutString) {
            style = map
        } else {
            style = [:]
        }
        let content = dictionary["content"] as? String
        var children: [FlexData] = []
        (dictionary["children"] as? [[String: Any]])?.forEach {
            let component = FlexData($0)
            children.append(component)
        }
        self.init(tag: tag,
                  layout: layout,
                  style: style,
                  content: content ?? "",
                  children: children)
    }

    @inline(__always)
    private static func map(cssString: String) -> [String: String]? {
        let array = cssString.split(separator: ",")
        guard !array.isEmpty else {
            warning("css is empty: \(cssString)")
            return nil
        }
        var map = [String: String]()
        array.forEach {
            let pair = $0.split(separator: ":")
            guard pair.count == 2 else {
                error("css pair is error: \($0)")
                return
            }
            let key = pair[0].trimmingCharacters(in: .whitespacesAndNewlines)
            guard map[key] == nil else {
                error("duplicate css pair: \(pair)")
                return
            }
            map[key] = pair[1].trimmingCharacters(in: .whitespacesAndNewlines)
        }
        return map.isEmpty ? nil : map
    }
}

extension FlexData {
    public final func render() -> View {
        let component: View
        switch tag {
        case .view:
            component = View()
        case .text:
            component = Text()
                .backgroundColor(.clear)
                .content(SwiftyMarkdown(string: content).attributedString())
        case .image:
            component = Image()
                .content(content)
        case .button:
            component = Button() // TODO: content
        }
        component.layout.set(layout: layout)
        // TODO: style
        style.forEach { (key, value) in
            switch key {
            case "background-color":
                if let color: Color = .css(value) {
                    component.backgroundColor(color)
                }
            default:
                break
            }
        }
        _ = component.children(children.map { $0.render() })
        return component
    }
}
