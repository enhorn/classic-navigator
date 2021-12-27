//
//  Toolbar.swift
//  Navigator
//
//  Created by Robin Enhorn on 2021-12-27.
//

import SwiftUI

struct Toolbar: View {

    let navigator: WebViewNavigator
    let geo: GeometryProxy
    @Binding var isLoading: Bool

    var body: some View {
        HStack(spacing: .tiny) {
            ToolbarActionButton(title: "Back", icon: .backward) {
                navigator.goBack()
            }
            ToolbarActionButton(title: "Forward", icon: .forward) {
                navigator.goForward()
            }
            Spacer().frame(width: 16)
            ToolbarActionButton(title: "Home", icon: .house) {
                navigator.goHome()
            }
            ToolbarActionButton(title: "Reload", icon: .arrowClockwise) {
                navigator.reload()
            }
            ToolbarActionButton(title: "Stop", icon: .stopCircle) {
                navigator.stop()
            }
            Spacer()
            ToolbarButton {
                GIF(name: "Loading.gif", isLoading: $isLoading)
            }
        }.padding(6)
        .frame(height: 75)
        .frame(width: geo.size.width)
        .background(Color.background)
    }
}
