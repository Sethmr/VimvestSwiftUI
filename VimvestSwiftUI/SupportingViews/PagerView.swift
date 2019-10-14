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

    // 1
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
            // 2
            .content.offset(x: self.isGestureActive ? self.offset : -geometry.size.width * CGFloat(self.index))
            // 3
            .frame(width: geometry.size.width, height: nil, alignment: .leading)
            .gesture(DragGesture().onChanged({ value in
                // 4
                self.isGestureActive = true
                // 5
                self.offset = value.translation.width + -geometry.size.width * CGFloat(self.index)
            }).onEnded({ value in
                if -value.predictedEndTranslation.width > geometry.size.width / 2, self.index < self.pages.endIndex - 1 {
                    self.index += 1
                }
                if value.predictedEndTranslation.width > geometry.size.width / 2, self.index > 0 {
                    self.index -= 1
                }
                // 6
                withAnimation { self.offset = -geometry.size.width * CGFloat(self.index) }
                // 7
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
