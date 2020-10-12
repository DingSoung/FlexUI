//
//  FlexButtonComponent.swift
//  FlexComponent
//
//  Created by Songwen Ding on 2019/6/6.
//  Copyright © 2019 Songwen Ding. All rights reserved.
//

import UIKit
import Extension

public typealias Button = UIButton

extension Button {
    @discardableResult public func content(_ block: @escaping () -> Swift.Void, for controlEvents: UIControl.Event = .touchUpInside) -> Self {
        let selector = Extension.selector(uid: hashValue.description,
                                          types: "v@:",
                                          classes: [Button.self],
                                          block: block)
        self.addTarget(self, action: selector, for: controlEvents)
        return self
    }
}
