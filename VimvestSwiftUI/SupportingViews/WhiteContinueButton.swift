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
                .frame(width: 364.clasp, height: 45.clasp)
                .cornerRadius(45.clasp / CGFloat(2.0))
                .shadow(color: Color(white: 0.0, opacity: 0.08), radius: 8.clasp, y: 7.clasp)
            Button("Continue", action: action)
                .font(.styled(.bold, size: 16.ats))
                .foregroundColor(.default)
        }
    }
}
