//
//  PagerView.swift
//  VimvestSwiftUI
//
//  Created by Seth Rininger on 10/12/19.
//  Copyright © 2019 Seth Rininger. All rights reserved.
//

import SwiftUI
import Combine

struct PagerView<Content: View & Identifiable>: View {

    @ObservedObject var pagerInfo:  PagerViewInfo
    @Binding var index: Int {
        didSet {
            pagerInfo.index = index
        }
    }
    @State private var offset: CGFloat = 0 {
        didSet {
            pagerInfo.offset = offset
        }
    }
    @State private var isGestureActive: Bool = false

    var pages: [Content]

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0) {
                    ForEach(self.pages) { page in
                        page
                            .frame(width: geometry.size.width, height: nil)
                    }
                }
            }

            // this a trick to switch between external and internal state changes
            .content.offset(x: self.isGestureActive ? self.offset : -geometry.size.width * CGFloat(self.index))

            // .leading is mandatory if you don't want to translate all offsets to center.
            .frame(width: geometry.size.width, height: nil, alignment: .leading)
            .gesture(DragGesture().onChanged({ value in

                // set the state to local state change
                self.isGestureActive = true

                // calculate the full offset from the gesture delta (*-1) plus the previous index state
                self.offset = value.translation.width + -geometry.size.width * CGFloat(self.index)
            }).onEnded({ value in
                if -value.predictedEndTranslation.width > geometry.size.width / 2, self.index < self.pages.endIndex - 1 {
                    self.index += 1
                }
                if value.predictedEndTranslation.width > geometry.size.width / 2, self.index > 0 {
                    self.index -= 1
                }

                // at the end set the final index based on the gesture predicted end, while rounding the offset up or down
                withAnimation { self.offset = -geometry.size.width * CGFloat(self.index) }

                // reset the state to handle external changes to index
                DispatchQueue.main.async { self.isGestureActive = false }
            }))
        }
    }
}


class PagerViewInfo: ObservableObject {

    var didChange = PassthroughSubject<Void, Never>()

    @Published var pageCount: Int {
        didSet {
            didChange.send()
        }
    }
    @Published var pageWidth: CGFloat = 414.clasp {
        didSet {
            didChange.send()
        }
    }
    @Published var index: Int = 0 {
        didSet {
            withAnimation {
                offset = -CGFloat(index) * pageWidth
            }
        }
    }
    @Published var offset: CGFloat = 0 {
        didSet {
            didChange.send()
        }
    }

    private var pageRatio: CGFloat {
        return -offset / pageWidth
    }
    var leftPage: Int {
        return Int(floor(pageRatio))
    }
    var pageOffset: CGFloat {
        return pageRatio.truncatingRemainder(dividingBy: 1)
    }

    init(pageCount: Int) {
        self.pageCount = pageCount
    }

    func printInfo() {
        print("index: \(index)")
        print("offset: \(offset)")
        print("pageRatio: \(pageRatio)")
        print("leftPage: \(leftPage)")
        print("pageOffset: \(pageOffset)")
    }

}
