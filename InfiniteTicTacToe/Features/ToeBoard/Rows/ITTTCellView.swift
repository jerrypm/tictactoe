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

            Text(symbol)
                .font(.system(size: .sixty, weight: .bold, design: .rounded))
                .foregroundColor(symbol == .xText ? .blue : .red)
        }
        .aspectRatio(.one, contentMode: .fit)
    }
}
