//
//  Clasp.swift
//  VimvestSwiftUI
//
//  Created by Seth Rininger on 10/12/19.
//  Copyright © 2019 Seth Rininger. All rights reserved.
//

import UIKit

// MARK: - UIScreen
extension UIScreen {

    enum DeviceType {
        case regular
        case plus
    }

    static func getDevice() -> DeviceType {
        switch main.bounds.size.width {
        case 375:
            return .regular
        case 414:
            return .plus
        default:
            return .plus
        }
    }

    static var deviceType = getDevice()

}

// MARK: - CGFloat
extension CGFloat {

    var ats: CGFloat {
        return adjustedToScreen
    }

    var adjustedToScreen: CGFloat {
        switch UIScreen.deviceType {
        case .regular:
            return self * 0.9057971014 // 375.0/414.0
        case .plus:
            return self
        }
    }

    var pixelRounded: CGFloat {
        switch UIScreen.main.scale {
        case 3:
            let truncatingRemainder = self.truncatingRemainder(dividingBy: 1)
            switch truncatingRemainder {
            case 0..<0.1666666667:
                return floor(self)
            case 0.1666666667..<0.5:
                return floor(self) + 0.33
            case 0.5..<0.8333333333:
                return floor(self) + 0.67
            default:
                return floor(self) + 1
            }
        default:
            let value: CGFloat = UIScreen.main.scale == 1 ? 1 : 0.5
            let remainder = self.truncatingRemainder(dividingBy: value)
            let shouldRoundUp = remainder >= (value / 2) ? true : false
            let multiple = floor(self / value)
            return !shouldRoundUp ? value * multiple : value * multiple + value
        }
    }

    var clasp: CGFloat { return self.adjustedToScreen.pixelRounded }

}

extension Int {

    var ats: CGFloat {
        return CGFloat(self).adjustedToScreen
    }
    var clasp: CGFloat {
        return CGFloat(self).clasp
    }

}

extension Double {

    var ats: CGFloat {
        return CGFloat(self).adjustedToScreen
    }
    var clasp: CGFloat {
        return CGFloat(self).clasp
    }

}
