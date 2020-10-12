//
//  View.swift
//  FlexComponent
//
//  Created by Songwen Ding on 2019/6/6.
//  Copyright © 2019 Songwen Ding. All rights reserved.
//

import UIKit
import Extension
import Kingfisher

public typealias Image = UIImageView

extension Image {
    @discardableResult public func content(_ img: Extension.Img) -> Self {
        self.image = img
        return self
    }

    @discardableResult public func content(_ name: String, placeholder: Img? = nil) -> Self {
        if let img = Img(named: name) {
            self.image = img
        } else {
            self.kf.indicatorType = .none
            self.kf.setImage(
                with: URL(string: name),
                placeholder: placeholder,
                options: [
                    //.processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ], completionHandler: { result in
                    switch result {
                    case .success(let value):
                        self.image = value.image
                    case .failure(let error):
                        Extension.error("set image fail", error.localizedDescription)
                    }
                })
        }
        return self
    }
}
