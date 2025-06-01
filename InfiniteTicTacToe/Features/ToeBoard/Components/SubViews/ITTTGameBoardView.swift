//
//  ITTTGameBoardView.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 27/05/25.
//

import SwiftUI

struct ITTTGameBoardView: View {
    // MARK: - Properties

    @StateObject private var viewModel = ITTTGameViewModel()

    // MARK: - Body

    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: .ten), count: .three), spacing: .ten) {
            ForEach(0 ..< 9) { index in
                ITTTCellView(symbol: viewModel.board[index])
                    .onTapGesture {
                        if viewModel.board[index] == .empty && viewModel.isHumanTurn && !viewModel.gameOver {
                            viewModel.handleHumanMove(index: index)
                        }
                    }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(.twenty)
        .shadow(radius: .five)
    }
}
