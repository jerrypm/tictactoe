//
//  ITTTBoardView.swift
//  InfiniteTicTacToe
//
//  Created by JPM on 05/12/24.
//
//  this is Infinite TicTacToe Board

import SwiftUI

struct ITTTBoardView: View {
    @StateObject private var viewModel = ITTTGameViewModel()

    var body: some View {
        ZStack {
            ITTTLinearGradientView()

            VStack(spacing: .twenty) {
                titleAndScores
                gameBoard
                statusMessage
                resetButton
            }
            .padding()
            .background(Color(.clear))
        }
    }

    // MARK: Title

    private var titleAndScores: some View {
        // Title and Scores
        VStack {
            Text("Toe")
                .font(.system(size: .thirtySix, weight: .bold, design: .rounded))
                .foregroundColor(.primary)

            HStack {
                Text("You: \(viewModel.humanScore)/3")
                    .foregroundColor(.blue)
                Spacer()
                Text("AI: \(viewModel.aiScore)/3")
                    .foregroundColor(.red)
            }
            .font(.system(size: .twenty, weight: .medium, design: .rounded))
        }
    }

    // MARK: Game Board

    private var gameBoard: some View {
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

    // MARK: Status Message

    private var statusMessage: some View {
        Text(viewModel.statusMessage)
            .font(.system(size: .twentyFour, weight: .medium, design: .rounded))
            .foregroundColor(.accentColor)
    }

    // MARK: Button

    private var resetButton: some View {
        Button(action: viewModel.resetGame) {
            Text(viewModel.gameOver ? SC.newGame : SC.resetRound)
                .font(.system(size: .twenty, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(.fourteen)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ITTTBoardView()
}
