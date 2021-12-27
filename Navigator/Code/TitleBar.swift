//
//  TitleBar.swift
//  Navigator
//
//  Created by Robin Enhorn on 2021-12-27.
//

import SwiftUI

struct TitleBar: View {

    var body: some View {
        GeometryReader { geo in
            HStack() {
                HStack(spacing: .small) {
                    TitleBarButton(
                        content: { Spacer() },
                        onTap: { print("Tapped Close") }
                    )

                    TitleBarLines()
                    Text("Classic Navigator").font(.titleBar).padding(4)
                    TitleBarLines()

                    TitleBarButton(
                        content: {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 10, height: 10)
                                .border(Color.border, width: .border)
                        },
                        onTap: { print("Tapped Resize") }
                    )

                    TitleBarButton(
                        content: {
                            HStack(alignment: .center) {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: .titleBarButtonSize, height: 5)
                                    .border(Color.border, width: .border)
                            }.frame(width: .titleBarButtonSize, height: .titleBarButtonSize)
                        },
                        onTap: { print("Tapped Minimize") }
                    )
                }
                .padding([.leading, .trailing], .medium)
                .padding([.top, .bottom], .small)
            }
            .frame(width: geo.size.width, height: .titleBarHeight)
            .border(alignment: .bottom)
        }
    }

}

struct TitleBarLines: View {

    var body: some View {
        VStack(spacing: .zero) {
            ForEach(0..<5) { _ in
                Rectangle()
                    .foregroundColor(.lighting)
                    .frame(height: 1)
                Rectangle()
                    .foregroundColor(.border)
                    .frame(height: 1)
                    .padding(.bottom, 1)
            }
        }
    }

}

struct TitleBarButton<Content>: View where Content: View {

    @ViewBuilder let content: (() -> Content)
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            ZStack(alignment: .topLeading) {
                Rectangle()
                    .fill(LinearGradient(
                        colors: [.titleBarButtonTop, .titleBarButtonBottom],
                        startPoint: UnitPoint(x: 0, y: 0),
                        endPoint: UnitPoint(x: 1, y: 1)
                    )).frame(width: .titleBarButtonSize, height: .titleBarButtonSize)
                content()
            }
        }
        .buttonStyle(.borderless)
        .frame(width: .titleBarButtonSize, height: .titleBarButtonSize)
        .border(Color.border, width: .border)
        .contentShape(RoundedRectangle(cornerRadius: 0))
    }

}
