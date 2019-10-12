//
//  InitialView.swift
//  VimvestSwiftUI
//
//  Created by Seth Rininger on 10/12/19.
//  Copyright © 2019 Seth Rininger. All rights reserved.
//

import SwiftUI

struct InitialView: View {
    @State var showSplash = true

    var body: some View {
        ZStack {
            nextView
            GoalTypeIconView()
                .opacity(showSplash ? 1 : 0)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation() {
                            self.showSplash = false
                        }
                    }
                }
        }.edgesIgnoringSafeArea(.all)
    }

    var nextView: some View {
        return OnboardingScrollingView()
    }
}

#if DEBUG
struct InitialView_Previews: PreviewProvider {
  static var previews: some View {
    InitialView()
  }
}
#endif
