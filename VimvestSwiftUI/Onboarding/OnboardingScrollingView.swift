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

    var body: some View {
        VStack {
            PagerView(
                index: $index,
                pages: (0..<OnboardingType.allCases.count).map { index in OnboardingPageView(id: index)
                }
            )
        }
    }
}
