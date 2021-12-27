//
//  GIF.swift
//  Navigator
//
//  Created by Robin Enhorn on 2021-12-26.
//

import SwiftUI

struct GIF {
    let name: String
    @Binding var isLoading: Bool
}

extension GIF: NSViewRepresentable {

    typealias NSViewType = NSImageView

    func makeNSView(context: Context) -> NSImageView {
        NSImageView()
    }

    func updateNSView(_ nsView: NSImageView, context: Context) {
        nsView.setGifImage(try! NSImage(gifName: name))
        if isLoading {
            nsView.startAnimatingGif()
        } else {
            nsView.stopAnimatingGif()
            nsView.showFrameAtIndex(0)
        }
    }

}

struct GIF_Previews: PreviewProvider {
    static var previews: some View {
        GIF(name: "Loading.gif", isLoading: .constant(true))
    }
}
