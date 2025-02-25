//
//  InfiniteTicTacToeView.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 05/12/24.
//

import SwiftUI

struct InfiniteTicTacToeView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            // Title and Scores
            VStack {
                Text("Infinity Tic Tac Toe")
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
            
            // Game Board
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
            
            // Status Message
            Text(viewModel.statusMessage)
                .font(.system(size: 24, weight: .medium, design: .rounded))
                .foregroundColor(.accentColor)
            
            // Reset Button
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
        .padding()
        .background(Color(.systemBackground))
    }
}

#Preview {
    InfiniteTicTacToeView()
}
