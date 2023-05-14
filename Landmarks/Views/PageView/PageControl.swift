//
//  PageControl.swift
//  Landmarks
//
//  Created by Felipe Christian Lautenschlager on 14/05/2023.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(control: self)
    }

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrtentPage(sender:)),
            for: .valueChanged)

        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }

    class Coordinator: NSObject {
        var control: PageControl

        init(control: PageControl) {
            self.control = control
        }

        @objc
        func updateCurrtentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}

