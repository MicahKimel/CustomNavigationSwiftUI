//
//  ButtonController.swift
//  CustomNavigation (iOS)
//
//  Created by Micah Kimel on 5/27/22.
//

import Foundation
import SwiftUI
extension View {
    dynamic func buttonStyleBlue(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyle(color: Color.blue, enabled: enabled))
    }
    dynamic func buttonStyleGreen(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyle(color: Color.green, enabled: enabled))
    }
}

struct ButtonStyle: ViewModifier {
    private let color: Color
    private let enabled: () -> Bool
    init(color: Color, enabled: @escaping () -> Bool = { true }) {
        self.color = color
        self.enabled = enabled
    }

    dynamic func body(content: Content) -> some View {
        content
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .foregroundColor(Color.white)
            .background(enabled() ? color : Color.black)
            .cornerRadius(5)
    }
}
