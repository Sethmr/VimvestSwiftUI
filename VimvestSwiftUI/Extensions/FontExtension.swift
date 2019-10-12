//
//  FontExtension.swift
//  VimvestSwiftUI
//
//  Created by Seth Rininger on 10/12/19.
//  Copyright © 2019 Seth Rininger. All rights reserved.
//

import SwiftUI

extension Font {

    public enum AvenirNextName: String {
        case medium = "AvenirNext-Medium"
        case demiboldItalic = "AvenirNext-DemiBoldItalic"
        case demibold = "AvenirNext-DemiBold"
        case heavyItalic = "AvenirNext-HeavyItalic"
        case regular = "AvenirNext-Regular"
        case italic = "AvenirNext-Italic"
        case mediumItalic = "AvenirNext-MediumItalic"
        case ultraLightItalic = "AvenirNext-UltraLightItalic"
        case boldItalic = "AvenirNext-BoldItalic"
        case heavy = "AvenirNext-Heavy"
        case bold = "AvenirNext-Bold"
        case ultraLight = "AvenirNext-UltraLight"
    }

    public static func styled(_ name: AvenirNextName = .regular, size: CGFloat) -> Font {
        return Font.custom(name.rawValue, size: size)
    }

}
