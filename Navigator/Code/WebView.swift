//
//  WebView.swift
//  Navigator
//
//  Created by Robin Enhorn on 2021-12-26.
//

import SwiftUI
import WebKit

struct WebView : NSViewRepresentable {
    typealias NSViewType = WKWebView

    let navigator: WebViewNavigator
    @Binding var url: String
    @Binding var useWayBack: Bool

    init(url: Binding<String>, useWayBack: Binding<Bool>, isLoading: Binding<Bool>) {
        self._url = url
        self._useWayBack = useWayBack
        self.navigator = WebViewNavigator(url: url, isLoading: isLoading)
    }

    func makeNSView(context: Context) -> WKWebView  {
        return WKWebView()
    }

    func updateNSView(_ webView: WKWebView, context: Context) {
        if let url = generateURL() {
            navigator.webView = webView
            webView.navigationDelegate = navigator
            webView.load(URLRequest(url: url))
        }
    }

    func generateURL() -> URL? {
        guard let parsed = URL(string: url) else { return nil }
        if useWayBack, url != .authorWebsite {
            return URL(string: "https://web.archive.org/web/1996if_/\(url)")
        } else {
            return parsed
        }
    }

}
