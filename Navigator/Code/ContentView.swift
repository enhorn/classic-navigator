//
//  ContentView.swift
//  Navigator
//
//  Created by Robin Enhorn on 2021-12-26.
//

import SwiftUI
import SwiftyGif
import SFSafeSymbols
import WebKit

struct ContentView: View {

    @State var isLoading: Bool = false
    @State var useWayBack: Bool = true
    @Binding var url: String

    var body: some View {
        let webview = WebView(url: $url, useWayBack: $useWayBack, isLoading: $isLoading)
        return GeometryReader { geo in
            VStack(spacing: .zero) {
                Toolbar(navigator: webview.navigator, geo: geo, isLoading: $isLoading)
                AddressBar(useWayBack: $useWayBack, url: $url)
                webview.frame(width: geo.size.width, height: geo.size.height - 110)
            }.frame(width: geo.size.width)
                .foregroundColor(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(url: .constant(.homeURL))
            .frame(width: 640, height: 480)
    }
}
