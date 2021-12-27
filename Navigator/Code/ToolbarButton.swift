//
//  ToolbarButton.swift
//  Navigator
//
//  Created by Robin Enhorn on 2021-12-26.
//

import SwiftUI
import SFSafeSymbols

struct ToolbarButton<Content>: View where Content: View {

    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(alignment: .trailing) {
            content()
        }
        .frame(width: .toolBarSize, height: .toolBarSize)
        .border(alignments: [.top, .leading], color: .lighting)
        .border(alignments: [.bottom, .trailing])
    }

}

struct ToolbarActionButton: View {

    let title: String
    let icon: SFSymbol
    let onTap: () -> Void

    var body: some View {
        ToolbarButton{
            VStack(spacing: 0) {
                Image(systemSymbol: icon)
                    .scaleEffect(1.3)
                    .frame(width: 30, height: 30)
                Text(title).font(.toolBarButton)
            }.foregroundColor(.black)
        }.onTapGesture(perform: onTap)
    }

}
