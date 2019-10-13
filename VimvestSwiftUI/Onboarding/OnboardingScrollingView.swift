//
//  OnboardingScrollingView.swift
//  VimvestSwiftUI
//
//  Created by Seth Rininger on 10/12/19.
//  Copyright © 2019 Seth Rininger. All rights reserved.
//

import SwiftUI

struct OnboardingScrollingView: View {
    @State var index: Int = 0
    @State var pageRatio: CGFloat = 0
    @State var offset: CGFloat = 0 {
        didSet {
            pageRatio = offset / 414.clasp
        }
    }

    var body: some View {
        VStack {
            PagerView(
                index: $index,
                offset: $offset,
                pages: (0..<OnboardingType.allCases.count).map { index in
                    OnboardingPageView(id: index)
                }
            )
            Spacer()
                .frame(height: 35.clasp)
            PagerDotControlView(
                dotCount: OnboardingType.allCases.count,
                pageRatio: $pageRatio
            )
            ZStack {
                Image("FooterDots")
                    .frame(width: 414.clasp, height: 121.clasp)
                WhiteContinueButton {
                    self.continueTapped()
                }
            }
            Spacer()
                .frame(height: 35.clasp)
        }.edgesIgnoringSafeArea(.all)
    }

    private func continueTapped() {
        withAnimation {
            index += 1
        }
    }
}
