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
            SwiftUIPagerView(index: $index, pages: (0..<4).map { index in OnboardingPageView(id: index) } )
        }
    }
}

#if DEBUG
struct OnboardingScrollingView_Previews: PreviewProvider {
    static var previews: some View {
        GoalTypeIconView()
    }
}
#endif
