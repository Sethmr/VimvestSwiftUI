//
//  GoalType.swift
//  VimvestSwiftUI
//
//  Created by Seth Rininger on 10/12/19.
//  Copyright © 2019 Seth Rininger. All rights reserved.
//

import SwiftUI

enum GoalType: CaseIterable {

    case investing
    case saving
    case giving

    var gradientColors: (Color, Color) {
        switch self {
        case .investing:
            return Color.investingGradience
        case .saving:
            return Color.savingGradience
        case .giving:
            return Color.givingGradience
        }
    }

    var circleGradient: LinearGradient {
        switch self {
        case .investing:
            return LinearGradient(
                gradient: Gradient(colors: [gradientColors.0, gradientColors.1]),
                startPoint: UnitPoint(x: 0.23, y: 0.72),
                endPoint: UnitPoint(x: 1.18, y: -0.05)
            )
        case .saving:
            return LinearGradient(
                gradient: Gradient(colors: [gradientColors.0, gradientColors.1]),
                startPoint: UnitPoint(x: 0.13, y: 0.85),
                endPoint: UnitPoint(x: 0.85, y: 0.23)
            )
        case .giving:
            return LinearGradient(
                gradient: Gradient(colors: [gradientColors.0, gradientColors.1]),
                startPoint: UnitPoint(x: 0, y: 0),
                endPoint: UnitPoint(x: 1, y: 1)
            )
        }
    }

}
