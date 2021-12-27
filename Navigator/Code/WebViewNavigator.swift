//
//  WebViewNavigator.swift
//  Navigator
//
//  Created by Robin Enhorn on 2021-12-27.
//

import SwiftUI
import WebKit

class WebViewNavigator: NSObject, WKNavigationDelegate {

    @Binding var url: String
    @Binding var isLoading: Bool

    var webView: WKWebView?

    init(url: Binding<String>, isLoading: Binding<Bool>) {
        self._url = url
        self._isLoading = isLoading
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        isLoading = true
        if let loading = webView.url {
            var new = loading.absoluteString.replacingOccurrences(of: "https://web.archive.org/web", with: "")
            if let regex = try? NSRegularExpression(pattern: "^/[0-9]+(if_)*/", options: .caseInsensitive) {
                new = regex.stringByReplacingMatches(in: new, options: .withTransparentBounds, range: NSMakeRange(0, new.count), withTemplate: "")
            }
            if new != url {
                url = new
            }
        }
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        isLoading = false
    }

    func goHome() {
        url = .homeURL
    }

    func goBack() {
        webView?.goBack()
    }

    func goForward() {
        webView?.goForward()
    }

    func stop() {
        webView?.stopLoading()
    }

    func reload() {
        webView?.reload()
    }

}
