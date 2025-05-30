//
//  Extension+Image.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 25/05/25.
//

import SwiftUI

extension Image {
    // MARK: Circle Button Image Style

    func circleButtonStyle(
        size: CGFloat = .twentyFour,
        weight: Font.Weight = .bold,
        foregroundColor: Color = .white,
        backgroundColor: Color = Color.black.opacity(.pointFour),
        circleSize: CGFloat = .thirtySix
    ) -> some View {
        self
            .font(.system(size: size, weight: weight))
            .foregroundColor(foregroundColor)
            .background(
                Circle()
                    .fill(backgroundColor)
                    .frame(width: circleSize, height: circleSize)
            )
    }
}
