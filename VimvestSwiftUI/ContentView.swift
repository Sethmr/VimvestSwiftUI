//
//  ContentView.swift
//  VimvestSwiftUI
//
//  Created by Seth Rininger on 10/12/19.
//  Copyright © 2019 Seth Rininger. All rights reserved.
//

import SwiftUI

struct GoalTypeIcon: View {
    var body: some View {
        HStack(spacing: 15.79.clasp) {
            ForEach(GoalType.allCases, id: \.self) { type in
                Circle()
                    .fill(type.circleGradient)
                    .frame(diameter: 25.clasp)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GoalTypeIcon()
    }
}
