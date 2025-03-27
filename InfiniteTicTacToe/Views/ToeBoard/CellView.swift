//
//  CellView.swift
//  InfiniteTicTacToe
//
//  Created by JPM on 05/12/24.
//
import SwiftUI

struct CellView: View {
    let symbol: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.colorPrimary)
                .shadow(radius: 2)

            Text(symbol)
                .font(.system(size: 60, weight: .bold, design: .rounded))
                .foregroundColor(symbol == "X" ? .blue : .red)
        }
        .aspectRatio(1, contentMode: .fit)
    }
}
