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

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }


    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "html") {
            uiView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
    }

    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        
        configuration.userContentController.add(context.coordinator, name: "hapticHandler")
        
        let webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
    }

    class Coordinator: NSObject, WKScriptMessageHandler {
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            if message.name == "hapticHandler" {
                let impactMed = UIImpactFeedbackGenerator(style: .light)
                impactMed.prepare()
                impactMed.impactOccurred()
            }
        }
    }
}
