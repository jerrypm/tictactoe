//
//  ITTTHomeLastScoreView.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 26/05/25.
//

import SwiftUI

public struct ITTTHomeLastScoreView: View {
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

            ScrollView {
                VStack(spacing: .zero) {
                    ForEach(viewModel.gameHistory) { game in
                        ITTTGameHistoryRow(game: game)
                    }
                }
                .background(Color.black.opacity(.pointThreeFive))
                .cornerRadius(.twelve)
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: .twenty)
            }
            .scrollIndicators(.hidden)
            .padding(.horizontal)
        }
    }
}
