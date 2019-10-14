//
//  WhiteContinueButton.swift
//  VimvestSwiftUI
//
//  Created by Seth Rininger on 10/12/19.
//  Copyright © 2019 Seth Rininger. All rights reserved.
//

import SwiftUI

struct WhiteContinueButton: View {

    var action: () -> Void

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .cornerRadius(45.clasp / CGFloat(2.0))
                .shadow(color: Color(white: 0.0, opacity: 0.08), radius: 8.clasp, y: 7.clasp)
            Button(action: action) {
                Text("Continue")
                    .font(.styled(.bold, size: 16.ats))
                    .foregroundColor(.default)
                    .padding(EdgeInsets(vertical: 12.clasp, horizontal: 146.clasp))
            }
        }
        .frame(width: 364.clasp, height: 45.clasp)
    }
}
