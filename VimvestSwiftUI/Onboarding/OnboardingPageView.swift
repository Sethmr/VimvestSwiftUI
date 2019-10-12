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

    var type: OnboardingType {
        return OnboardingType(rawValue: id)!
    }

    var body: some View {
        VStack {
            type.image.resizable()
                .frame(width: 375.clasp, height: 341.clasp)
            Spacer()
                .frame(height: 42.clasp)
            Text(type.title)
                .foregroundColor(type.titleColor)
                .font(.styled(.demibold, size: 20.ats))
                .kerning(3.33.ats)
            Spacer()
                .frame(height: 14.clasp)
            Text(type.subtitle)
                .lineLimit(2)
                .foregroundColor(.default)
                .font(.styled(.demibold, size: 24.ats))
                .multilineTextAlignment(.center)
                .lineSpacing(-2.clasp)
            Spacer()
                .frame(height: 20.clasp)
            Text(type.moreInfo)
                .foregroundColor(.textGray)
                .lineLimit(2)
                .font(.styled(.medium, size: 14.ats))
                .multilineTextAlignment(.center)
            Spacer()
        }
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


#if DEBUG
struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(id: 0)
    }
}
#endif
