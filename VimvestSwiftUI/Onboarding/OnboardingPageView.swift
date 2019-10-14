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
        GeometryReader { proxy in
            VStack {
                Spacer()
                    .frame(height: self.type.imageTopSpacing)
                self.type.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: self.type.imageSize.width, height: self.type.imageSize.height)
                Spacer()
                    .frame(height: self.type.imageBotSpacing)
                Text(self.type.title)
                    .foregroundColor(self.type.titleColor)
                    .font(.styled(.demibold, size: 20.ats))
                    .kerning(3.33.ats)
                    .offset(x: proxy.frame(in: .global).minX / 2, y: 0)
                Spacer()
                    .frame(height: 14.clasp)
                Text(self.type.subtitle)
                    .lineLimit(2)
                    .foregroundColor(.default)
                    .font(.styled(.demibold, size: 24.ats))
                    .multilineTextAlignment(.center)
                    .lineSpacing(-2.clasp)
                    .offset(x: proxy.frame(in: .global).minX / 1.5, y: 0)
                Spacer()
                    .frame(height: 20.clasp)
                Text(self.type.moreInfo)
                    .foregroundColor(.textGray)
                    .lineLimit(2)
                    .font(.styled(.medium, size: 14.ats))
                    .multilineTextAlignment(.center)
                    .offset(x: proxy.frame(in: .global).minX / 3, y: 0)
                Spacer()
            }
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
