//
//  ViewExtension.swift
//  VimvestSwiftUI
//
//  Created by Seth Rininger on 10/12/19.
//  Copyright © 2019 Seth Rininger. All rights reserved.
//

import SwiftUI

extension View {

    @inlinable public func frame(diameter: CGFloat? = nil, alignment: Alignment = .center) -> some View {
        frame(width: diameter, height: diameter, alignment: alignment)
    }

}
