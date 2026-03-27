//
//  WebView.swift
//  SDX webmodel
//
//  Created by Moritz Wendt on 27.03.26.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let fileName: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "html") {
            uiView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
    }
}
