//
//  Text.swift
//  FlexComponent
//
//  Created by Songwen Ding on 2019/6/6.
//  Copyright © 2019 Songwen Ding. All rights reserved.
//

import Foundation
import Graph

public typealias Text = Label

extension Text {
    @discardableResult public func content(_ attributedText: NSAttributedString) -> Self {
        self.attributedText = attributedText
        return self
    }
}
