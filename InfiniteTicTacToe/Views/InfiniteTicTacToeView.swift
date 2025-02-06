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
        VStack {
            // Header
            Text("Tic Tac Toe")
                .font(.largeTitle)
                .bold()
                .padding(.top)
            
            // Game Status
            Text(viewModel.gameStatus)
                .font(.headline)
                .foregroundColor(viewModel.gameStatus.contains("Win") ? .green : .primary)
                .padding()
            
            // Game Board
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: viewModel.gridSize), spacing: 8) {
                ForEach(viewModel.cells) { cell in
                    CellView(cell: cell, action: {
                        withAnimation {
                            viewModel.makeMove(row: cell.row, column: cell.column)
                        }
                    })
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 2)
            )
            .padding()
            
            // Control Buttons
            HStack(spacing: 20) {
                Button(action: {
                    withAnimation {
                        viewModel.resetGame()
                    }
                }) {
                    Text("New Game")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 120)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    withAnimation {
                        viewModel.undoMove()
                    }
                }) {
                    Text("Undo")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(minWidth: 120)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
            }
            .padding(.bottom)
        }
        .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    InfiniteTicTacToeView()
}
