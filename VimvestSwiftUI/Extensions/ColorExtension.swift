//
//  ColorExtension.swift
//  VimvestSwiftUI
//
//  Created by Seth Rininger on 10/12/19.
//  Copyright © 2019 Seth Rininger. All rights reserved.
//

import SwiftUI

extension Color {

    public static let investingGradience: (Color, Color) = (
        Color(red: 2/255, green: 221/255, blue: 175/255),
        Color(red: 19/255, green: 241/255, blue: 199/255)

    )

    public static let savingGradience: (Color, Color) = (
        Color(red: 0/255, green: 216/255, blue: 224/255),
        Color(red: 56/255, green: 238/255, blue: 243/255)
    )

    public static let givingGradience: (Color, Color) = (.giving, .giving)

    public static let `default` = Color(red: 94/255, green: 96/255, blue: 97/255)
    public static let saving = Color(red: 48/255, green: 235/255, blue: 240/255)
    public static let investing = Color(red: 11/255, green: 232/255, blue: 188/255)
    public static let giving = Color(red: 252/255, green: 91/255, blue: 120/255)

    public static let textLightGray = Color(red: 164/255, green: 173/255, blue: 177/255)
    public static let textGray = Color(red: 149/255, green: 154/255, blue: 156/255)

    public static func gray(_ scale: Double) -> Color {
        return Color(white: scale / 255)
    }

}

