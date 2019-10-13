//
//  OnboardingType.swift
//  VimvestSwiftUI
//
//  Created by Seth Rininger on 10/12/19.
//  Copyright © 2019 Seth Rininger. All rights reserved.
//

import SwiftUI

enum OnboardingType: Int, CaseIterable {
    case goals
    case stocks
    case beliefs
    case giving
    case split

    var title: String {
        switch self {
        case .goals:
            return "GOALS"
        case .stocks:
            return "STOCKS"
        case .beliefs:
            return "BELIEFS"
        case .giving:
            return "GIVING"
        case .split:
            return "SPLIT DEPOSIT"
        }
    }

    var titleColor: Color {
        switch self {
        case .goals:
            return .saving
        case .stocks:
            return .investing
        case .beliefs:
            return .investing
        case .giving:
            return .giving
        case .split:
            return .textLightGray
        }
    }

    var subtitle: String {
        switch self {
        case .goals:
            return "Save for and visualize\nall of your goals."
        case .stocks:
            return "Invest in your favorite\ncompanies one dollar at a time."
        case .beliefs:
            return "Invest in ideas that\nmatter to you."
        case .giving:
            return "Change the world with\na little bit of change."
        case .split:
            return "Split up your money\nwith one deposit."
        }
    }

    var moreInfo: String {
        switch self {
        case .goals:
            return "Think things like Retirement, your next Disney\nvacation, a new gadget. All in one place."
        case .stocks:
            return "Purchase fractional shares in Apple, Amazon,\nTesla, or other favorites."
        case .beliefs:
            return "Purchase fractional shares in Apple, Amazon,\nTesla, or other favorites."
        case .giving:
            return "Select your favorite charities and send some\nchange their way when you deposit."
        case .split:
            return "Fund all of your goals, stocks, beliefs, and\ncharities with one, simple deposit."
        }
    }

    var image: Image {
        switch self {
        case .goals:
            return Image("OnboardingGoals")
        case .stocks:
            return Image("OnboardingStocks")
        case .beliefs:
            return Image("OnboardingBeliefs")
        case .giving:
            return Image("OnboardingGiving")
        case .split:
            return Image("OnboardingSplit")
        }
    }
}
