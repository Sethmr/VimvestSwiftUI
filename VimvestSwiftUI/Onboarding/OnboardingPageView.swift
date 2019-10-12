//
//  OnboardingPageView.swift
//  VimvestSwiftUI
//
//  Created by Seth Rininger on 10/12/19.
//  Copyright © 2019 Seth Rininger. All rights reserved.
//

import SwiftUI

struct OnboardingPageView: View, Identifiable {

    var id: Int

    var body: some View {
        Rectangle().fill(color(from: id))
    }

    func color(from index: Int) -> Color {
        switch index {
        case 0:
            return .blue
        case 1:
            return .red
        case 2:
            return .yellow
        case 3:
            return .purple
        default:
            return .black
        }
    }

}
