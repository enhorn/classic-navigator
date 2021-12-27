//
//  View+Border.swift
//  Navigator
//
//  Created by Robin Enhorn on 2021-12-27.
//

import SwiftUI

extension View {

    func border(alignments: [Alignment], color: Color = .border) -> some View {
        var someView: AnyView = AnyView(self)


        alignments.forEach { alignment in
            someView = AnyView(someView.border(alignment: alignment, color: color))
        }

        return someView
    }

    func border(alignment: Alignment, color: Color = .border) -> some View {
        overlay(Rectangle().frame(
            width: width(for: alignment),
            height: height(for: alignment),
            alignment: alignment
        ).foregroundColor(color), alignment: alignment)
    }

    func height(for alignment: Alignment) -> CGFloat? {
        switch alignment {
        case .top, .bottom: return .border
        default: return nil
        }
    }

    func width(for alignment: Alignment) -> CGFloat? {
        switch alignment {
        case .leading, .trailing: return .border
        default: return nil
        }
    }

}
