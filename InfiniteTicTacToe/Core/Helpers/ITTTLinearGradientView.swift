//
//  ITTTLinearGradientView.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 01/03/25.
//

import SwiftUI

struct ITTTLinearGradientView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.colorBackgroundDark,
                Color.colorBackgroundLight
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}
