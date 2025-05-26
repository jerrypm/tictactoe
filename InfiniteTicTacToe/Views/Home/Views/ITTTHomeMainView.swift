//
//  ITTTHomeMainView.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 01/03/25.
//

import SwiftUI

struct ITTTHomeMainView: View {
    // MARK: - Properties

    private let viewModel = ITTTHomeViewModel()

    // MARK: - State Properties

    @State private var navigateToGame = false

    // MARK: - Body

    var body: some View {
        NavigationStack {
            ZStack {
                ITTTLinearGradientView()

                VStack(spacing: .twentyFour) {
                    ITTTHeaderView()
                    gameModeSection
                    ITTTLastScoreView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .ignoresSafeArea()
            .navigationDestination(isPresented: $navigateToGame) {
                ITTTBoardView()
            }
        }
    }

    // MARK: - View Components

    private var gameModeSection: some View {
        VStack {
            Text(SC.gameMode)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)

            ITTTGameModeView(navigateToGame: $navigateToGame)
        }
    }
}

// MARK: - Preview

#Preview {
    ITTTHomeMainView()
}
