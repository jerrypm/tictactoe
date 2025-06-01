//
//  Extension+View.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 02/06/25.
//

import SwiftUI

extension View {
    // MARK: Custom Back - Main

    func itttBackButton(
        name: String = SC.icBack.value,
        font: Font = .title2,
        action: (() -> Void)? = nil
    ) -> some View {
        self.modifier(ITTTBackButtonModifier(
            name: name,
            font: font,
            action: action
        )
        )
    }
}

// MARK: Custom Back - Sub

struct ITTTBackButtonModifier: ViewModifier {
    @Environment(\.dismiss) private var dismiss

    let name: String
    let font: Font
    let action: (() -> Void)?

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        if let customAction = action {
                            customAction()
                        } else {
                            self.dismiss()
                        }
                    }) {
                        Image(self.name)
                            .font(self.font)
                    }
                }
            }
    }
}
