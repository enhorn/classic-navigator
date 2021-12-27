//
//  AddressBar.swift
//  Navigator
//
//  Created by Robin Enhorn on 2021-12-27.
//

import SwiftUI

struct AddressBar: View {

    @Binding var useWayBack: Bool
    @Binding var url: String

    var body: some View {
        HStack(spacing: .small) {
            Text("Location:").font(.textDefault)
            TextField("URL", text: $url)
                .foregroundColor(.black)
                .background(.white)
                .border(Color.border.opacity(0.7), width: .border)
                .padding(.trailing, .small)
            Toggle("Wayback Machine", isOn: $useWayBack).accentColor(.gray)
        }
        .padding(.top, .small)
        .padding([.leading, .trailing, .bottom], .medium)
        .background(Color.background)
        .border(alignment: .bottom)
    }
}
