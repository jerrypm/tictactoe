//
//  ITTTLastScoreView.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 26/05/25.
//

import SwiftUI

public struct ITTTLastScoreView: View {
    // MARK: - Properties

    private let viewModel = ITTTHomeViewModel()

    // MARK: - Body

    public var body: some View {
        VStack(spacing: .ten) {
            Text(SC.lastScore)
                .font(.system(size: .twentyFour, weight: .bold))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)

            VStack(spacing: .zero) {
                ForEach(viewModel.gameHistory) { game in
                    ITTTGameHistoryRow(game: game)
                }
            }
            .background(Color.black.opacity(.pointThreeFive))
            .cornerRadius(.twelve)
            .padding(.horizontal)
        }
    }
}
