//
//  ITTTParentHomeView.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 01/03/25.
//

import SwiftUI

struct ITTTParentHomeView: View {
    // MARK: - Properties

    private let viewModel = ITTTHomeViewModel()

    // MARK: - State Properties

    @StateObject private var navigationState = ITTTNavigationState()

    // MARK: - Body

    var body: some View {
        NavigationStack(path: $navigationState.navigationPath) {
            ZStack {
                ITTTLinearGradientView()

                VStack(spacing: .twentyFour) {
                    ITTTHomeHeaderView {
                        navigateToDestination(.settings)
                    }
                    gameModeSection
                    ITTTHomeLastScoreView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .ignoresSafeArea()
            .navigationDestination(for: NavigationDestination.self) { destination in
                ITTTNavigationHandler(destination: destination)
            }
        }
        .environmentObject(navigationState)
    }

    // MARK: - View Components

    private var gameModeSection: some View {
        VStack {
            Text(SC.gameMode)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)

            ITTTHomeGameModeView(onNavigateToGame: {
                navigateToDestination(.game)
            })
        }
    }

    private func navigateToDestination(_ destination: NavigationDestination) {
        navigationState.navigationPath.append(destination)
    }
}

// MARK: - Preview

#Preview {
    ITTTParentHomeView()
}
