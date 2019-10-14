//
//  PagerDotControlView.swift
//  VimvestSwiftUI
//
//  Created by Seth Rininger on 10/12/19.
//  Copyright © 2019 Seth Rininger. All rights reserved.
//

import SwiftUI

struct PagerDotControlView: View {

    @ObservedObject var pagerInfo: PagerViewInfo

    var body: some View {
        HStack(spacing: 5.clasp) {
            ForEach(0..<pagerInfo.pageCount, id: \.self) { index in
                ZStack {
                    Rectangle()
                        .fill(Color(white: 38 / 255).opacity(0.4))
                        .frame(diameter: self.diameter(at: index))
                        .cornerRadius(self.cornerRadius(at: index))
                        .opacity(self.unselectedOpacity(at: index))
                    Rectangle()
                        .fill(Color.default)
                        .frame(diameter: self.diameter(at: index))
                        .cornerRadius(self.cornerRadius(at: index))
                        .opacity(self.selectedOpacity(at: index))
                }
            }
        }
    }

    func unselectedOpacity(at index: Int) -> Double {
        switch index {
        case let x where x == pagerInfo.leftPage:
            return (pagerInfo.pageOffset < 0 ? 1 - abs(Double(pagerInfo.pageOffset)) : Double(pagerInfo.pageOffset))
        case let x where x == pagerInfo.leftPage + 1:
            return (1 - Double(pagerInfo.pageOffset))
        default:
            return 1
        }
    }

    func selectedOpacity(at index: Int) -> Double {
        switch index {
        case let x where x == pagerInfo.leftPage:
            return (1 - Double(pagerInfo.pageOffset))
        case let x where x == pagerInfo.leftPage + 1:
            return (pagerInfo.pageOffset < 0 ? 1 - abs(Double(pagerInfo.pageOffset)) : Double(pagerInfo.pageOffset))
        default:
            return 0
        }
    }

    func diameter(at index: Int) -> CGFloat {
        let diameter: CGFloat = 5.clasp
        switch index {
        case let x where x == pagerInfo.leftPage:
            return diameter + 2.clasp * (1 - pagerInfo.pageOffset)
        case let x where x == pagerInfo.leftPage + 1:
            return diameter + 2.clasp * (pagerInfo.pageOffset < 0 ? 1 - abs(pagerInfo.pageOffset) : pagerInfo.pageOffset)
        default:
            return diameter
        }
    }

    private func cornerRadius(at index: Int) -> CGFloat {
        let radius: CGFloat = 1.ats
        switch index {
        case let x where x == pagerInfo.leftPage:
            return radius + 2.5.ats * (1 - pagerInfo.pageOffset)
        case let x where x == pagerInfo.leftPage + 1:
            return radius + 2.5.ats * (pagerInfo.pageOffset < 0 ? 1 - abs(pagerInfo.pageOffset) : pagerInfo.pageOffset)
        default:
            return radius
        }
    }

}
