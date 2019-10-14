//
//  BasicTypeExtensions.swift
//  VimvestSwiftUI
//
//  Created by Seth Rininger on 10/13/19.
//  Copyright © 2019 Seth Rininger. All rights reserved.
//

import SwiftUI

extension EdgeInsets {

    @inlinable public init(vertical: CGFloat, horizontal: CGFloat) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }

    @inlinable public init(inset: CGFloat) {
        self.init(top: inset, leading: inset, bottom: inset, trailing: inset)
    }

}

