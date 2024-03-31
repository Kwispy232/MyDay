//
//  iOSCheckboxToggleStyle.swift
//  MyDay
//
//  Created by Sebastian Mraz on 31/03/2024.
//

import SwiftUI

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "checkmark.square")
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.darkGreen)
        }
    }
}
