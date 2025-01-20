//
//  ActivityIndicator.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    // MARK: Variables

    let style: UIActivityIndicatorView.Style
    private let spinner: UIActivityIndicatorView = {
        $0.hidesWhenStopped = true
        return $0
    }(UIActivityIndicatorView(style: .medium))

    // MARK: Binding

    @Binding var animate: Bool

    // MARK: Public Methods

    func makeUIView(context _: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        spinner.style = style
        return spinner
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context _: UIViewRepresentableContext<ActivityIndicator>) {
        if animate {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }

    func configure(_ indicator: (UIActivityIndicatorView) -> Void) -> some View {
        indicator(spinner)
        return self
    }
}

struct CustomActivityIndicator: View {
    var body: some View {
        ActivityIndicator(style: .large, animate: .constant(true))
            .padding(12)
            .cornerRadius(12)
    }
}
