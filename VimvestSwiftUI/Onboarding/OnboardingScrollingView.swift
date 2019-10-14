//
//  OnboardingScrollingView.swift
//  VimvestSwiftUI
//
//  Created by Seth Rininger on 10/12/19.
//  Copyright © 2019 Seth Rininger. All rights reserved.
//

import SwiftUI

struct OnboardingScrollingView: View {

    @ObservedObject var pagerInfo = PagerViewInfo(pageCount: OnboardingType.allCases.count)
    @State var index: Int = 0 {
        didSet {
            pagerInfo.index = index
        }
    }

    var body: some View {
        ZStack {
            PagerView(
                pagerInfo: pagerInfo,
                index: $index,
                pages: (0..<pagerInfo.pageCount).map { index in
                    OnboardingPageView(id: index)
                }
            )
            VStack {
                Spacer()
                PagerDotControlView(pagerInfo: pagerInfo)
                Spacer()
                    .frame(height: 29.clasp)
                Image("FooterDots")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 414.clasp, height: 157.clasp)
                    .edgesIgnoringSafeArea(.bottom)
            }
            VStack {
                Spacer()
                WhiteContinueButton {
                    self.continueTapped()
                }
                Spacer()
                    .frame(height: 35.clasp + Constant.bottomSafeArea)
            }
        }
    }

    private func continueTapped() {
        guard index < pagerInfo.pageCount - 1 else { return }
        withAnimation {
            index += 1
        }
    }
}
