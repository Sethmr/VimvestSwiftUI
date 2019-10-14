//
//  Constant.swift
//  VimvestSwiftUI
//
//  Created by Seth Rininger on 10/13/19.
//  Copyright © 2019 Seth Rininger. All rights reserved.
//

import SwiftUI

struct Constant {

    static var statusBarHeight: CGFloat = 0 {
        didSet {
            assert(statusBarHeight != 0)
            if statusBarHeight == 44 {
                bottomSafeArea = 34
            }
        }
    }

    static var bottomSafeArea: CGFloat = 0

}
