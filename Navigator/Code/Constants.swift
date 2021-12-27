//
//  Constants.swift
//  Navigator
//
//  Created by Robin Enhorn on 2021-12-27.
//

import SwiftUI

extension String {
    static let homeURL: String = "https://www.altavista.com"
    static let authorWebsite = "https://enhorn.github.io/"
}

extension Color {
    static let background: Color = Color(white: 0.8)
    static let lighting: Color = Color(white: 0.9)
    static let titleBarButtonTop: Color = Color(white: 0.6)
    static let titleBarButtonBottom: Color = Color(white: 0.9)
    static let border: Color = Color(white: 0.5)
}

extension CGFloat {
    static let titleBarHeight: CGFloat = 30
    static let titleBarButtonSize: CGFloat = 15
    static let toolBarSize: CGFloat = 60
    static let border: CGFloat = 2
    static let tiny: CGFloat = 2
    static let small: CGFloat = 4
    static let medium: CGFloat = 8
    static let large: CGFloat = 16
}

extension Int {
    static let titlebarTag: Int = 3737
}

extension Font {
    static let titleBar: Font = Font.custom("Verdana", size: 15)
    static let textDefault: Font = Font.custom("Verdana", size: 14)
    static let toolBarButton: Font = Font.custom("Verdana", size: 12)
}
