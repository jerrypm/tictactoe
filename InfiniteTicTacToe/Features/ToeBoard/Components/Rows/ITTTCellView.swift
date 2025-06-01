//
//  ITTTCellView.swift
//  InfiniteTicTacToe
//
//  Created by JPM on 05/12/24.
//
import SwiftUI

struct ITTTCellView: View {
    let symbol: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: .fourteen)
                .foregroundColor(.colorPrimary)
                .shadow(radius: .two)

            if let image = getImageName(for: symbol) {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
        }
        .aspectRatio(.one, contentMode: .fit)
    }

    private func getImageName(for symbol: String) -> Image? {
        switch symbol {
        case .xText:
            return ITTTImage.cross
        case .oText: // Assuming you have an "O" symbol
            return ITTTImage.ellipse
        default:
            return nil // Default fallback
        }
    }
}
