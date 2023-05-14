//
//  PageView.swift
//  Landmarks
//
//  Created by Felipe Christian Lautenschlager on 14/05/2023.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }

    var nextButton: some View {
        Button(action: changeToNextPage) {
            Image(systemName: "chevron.right.circle")
                .tint(.white)
                .padding()
        }
    }

    func changeToNextPage() {
        if currentPage == pages.count - 1 {
            currentPage = 0
        } else {
            currentPage += 1
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0)})
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
