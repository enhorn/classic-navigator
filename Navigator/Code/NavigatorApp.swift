//
//  NavigatorApp.swift
//  Navigator
//
//  Created by Robin Enhorn on 2021-12-26.
//

import SwiftUI
import AppKit
import Combine

fileprivate var observers: [NSKeyValueObservation] = []

@main
struct NavigatorApp: App {

    @State var url: String = .homeURL

    var body: some Scene {
        WindowGroup {
            ContentView(url: $url)
                .preferredColorScheme(.light)
                .border(Color.border, width: .border)
                .padding(.small)
                .background(Color.background)
                .frame(minWidth: 640, idealWidth: 800, minHeight: 480, idealHeight: 600)
                .onReceive(NotificationCenter.default.publisher(for: NSApplication.willUpdateNotification), perform: { _ in
                    switchToClassicTitleBar()
                })
        }
        .windowStyle(.hiddenTitleBar)
        .commands {
            CommandMenu("Bookmarks") {
                Button("Author Website") { url = .authorWebsite }
                Divider()
                Button("Altavista") { url = "https://www.altavista.com" }
                Button("AOL") { url = "https://www.aol.com" }
                Button("Amazon") { url = "https://www.amazon.com" }
                Button("FogCam") { url = "http://www.fogcam.org" }
                Button("Space Jam") { url = "http://www.spacejam.com" }
                Button("Strange Games") { url = "http://www.strangegames.com/" }
                Button("The Best Page in the Universe") { url = "http://www.thebestpageintheuniverse.net" }
                Button("Webcrawler") { url = "https://www.webcrawler.com" }
            }
        }
    }

    func switchToClassicTitleBar() {
        for window in NSApplication.shared.windows {
            window.standardWindowButton(.zoomButton)?.isHidden = true
            window.standardWindowButton(.closeButton)?.isHidden = true
            window.standardWindowButton(.miniaturizeButton)?.isHidden = true
            if window.contentView?.viewWithTag(.titlebarTag) == nil {
                window.contentView?.addSubview(createTitleBar(for: window))
            }
        }
    }

    func createTitleBar(for window: NSWindow) -> NSView {
        let view = TitleBarHoster(rootView: TitleBar())
        let updateFrame = { view.frame = CGRect(x: 0, y: -.titleBarHeight, width: window.frame.width, height: .titleBarHeight) }

        updateFrame()
        observers.append(window.observe(\.frame) { _, _ in
            updateFrame()
        })

        return view
    }

}

fileprivate class TitleBarHoster<Content>: NSHostingView<Content> where Content : View {
    override var tag: Int { return .titlebarTag }
}
