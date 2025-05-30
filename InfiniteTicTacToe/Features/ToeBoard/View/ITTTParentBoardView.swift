//
//  ITTTParentBoardView.swift
//  InfiniteTicTacToe
//
//  Created by JPM on 05/12/24.
//
//  this is Infinite TicTacToe Board

import SwiftUI

struct ITTTParentBoardView: View {
    // MARK: - Properties

    @StateObject private var viewModel = ITTTGameViewModel()

    // MARK: - Body

    var body: some View {
        ZStack {
            ITTTLinearGradientView()

            VStack(spacing: .twenty) {
                ITTTHeaderBoardView()
                ITTTGameBoardView()
                statusMessage
                resetButton
            }
            .padding()
            .background(Color(.clear))
        }
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
    ITTTParentBoardView()
}
