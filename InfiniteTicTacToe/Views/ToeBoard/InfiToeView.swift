//
//  InfiToeView.swift
//  InfiniteTicTacToe
//
//  Created by JPM on 05/12/24.
//
//  this is Infinite TicTacToe Board

import SwiftUI

struct InfiToeView: View {
    @StateObject private var viewModel = GameViewModel()

    var body: some View {
        ZStack {
            LinearGradientView()

            VStack(spacing: 20) {
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
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundColor(.primary)

            HStack {
                Text("You: \(viewModel.humanScore)/3")
                    .foregroundColor(.blue)
                Spacer()
                Text("AI: \(viewModel.aiScore)/3")
                    .foregroundColor(.red)
            }
            .font(.system(size: 20, weight: .medium, design: .rounded))
        }
    }

    // MARK: Game Board

    private var gameBoard: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
            ForEach(0 ..< 9) { index in
                CellView(symbol: viewModel.board[index])
                    .onTapGesture {
                        if viewModel.board[index] == "" && viewModel.isHumanTurn && !viewModel.gameOver {
                            viewModel.handleHumanMove(index: index)
                        }
                    }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .shadow(radius: 5)
    }

    // MARK: Status Message

    private var statusMessage: some View {
        Text(viewModel.statusMessage)
            .font(.system(size: 24, weight: .medium, design: .rounded))
            .foregroundColor(.accentColor)
    }

    // MARK: Button

    private var resetButton: some View {
        Button(action: viewModel.resetGame) {
            Text(viewModel.gameOver ? "New Game" : "Reset Round")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(15)
        }
        .padding(.horizontal)
    }
}

#Preview {
    InfiToeView()
}
