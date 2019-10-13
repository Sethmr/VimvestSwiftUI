//
//  PagerDotControlView.swift
//  VimvestSwiftUI
//
//  Created by Seth Rininger on 10/12/19.
//  Copyright © 2019 Seth Rininger. All rights reserved.
//

import SwiftUI

struct PagerDotControlView: View {
    let dotCount: Int
    @Binding var pageRatio: CGFloat

    private var leftDot: Int {
        return Int(pageRatio)
    }

    private var pageOffset: CGFloat {
        return pageRatio.truncatingRemainder(dividingBy: 1)
    }

    var body: some View {
        HStack(spacing: 5.clasp) {
            ForEach(0..<dotCount, id: \.self) { index in
                Rectangle()
                    .fill(Color.default)
                    .frame(diameter: self.diameter(at: index))
                    .cornerRadius(self.cornerRadius(at: index))
            }
        }
    }

    func diameter(at index: Int) -> CGFloat {
        let diameter: CGFloat = 5.clasp
        switch index {
        case let x where x == leftDot:
            return diameter + 2.clasp * pageOffset
        case let x where x == leftDot + 1:
            return diameter + 2.clasp * (1 - pageOffset)
        default:
            return diameter
        }
    }

    private func cornerRadius(at index: Int) -> CGFloat {
        let radius: CGFloat = 1.ats
        switch index {
        case let x where x == leftDot:
            return radius + 2.5.ats * pageOffset
        case let x where x == leftDot + 1:
            return radius + 2.5.ats * (1 - pageOffset)
        default:
            return radius
        }
    }

}
