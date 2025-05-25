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

    @State private var currentPageIndex: Int = .zero
    @State private var carouselOffset: CGFloat = .zero
    @State private var navigateToGame = false

    // MARK: - Constants

    private let numberOfGameModes: Int = .three
    private let cardSpacing: CGFloat = .twoHundredForty
    private let dragThreshold: CGFloat = .fifty

    // MARK: - Gesture State

    @GestureState private var dragOffset: CGFloat = .zero

    // MARK: - Body

    var body: some View {
        NavigationView {
            ZStack {
                ITTTLinearGradientView()

                VStack(spacing: .twenty) {
                    Spacer()
                        .frame(height: .fifty)

                    headerView
                    Spacer()
                    gameModeSection
                    Spacer()
                    lastScoreSection
                    Spacer()
                }

                NavigationLink(
                    destination: ITTTBoardView(),
                    isActive: $navigateToGame,
                    label: { EmptyView() }
                )
            }
            .ignoresSafeArea()
        }
    }

    // MARK: - View Components

    private var headerView: some View {
        HStack {
            ITTTImage.titleXOX
                .resizable()
                .scaledToFit()
                .frame(height: .thirtyTwo)

            Spacer()

            ITTTImage.settings
                .frame(height: .twentyFour)
        }
        .padding(.horizontal)
    }

    private var gameModeSection: some View {
        VStack {
            Text(SC.gameMode)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)

            gameModeCarousel
            carouselNavigationButtons
            pageIndicators
        }
    }

    private var gameModeCarousel: some View {
        ZStack {
            ForEach(.zero..<numberOfGameModes, id: \.self) { index in
                ITTTGameModeCardView(isMiddle: currentPageIndex == index) {
                    if index == .zero {
                        navigateToGame = true
                    }
                }
                .offset(x: CGFloat(index - currentPageIndex) * cardSpacing + carouselOffset + dragOffset)
                .zIndex(currentPageIndex == index ? 1 : .zero)
                .animation(.spring(response: .pointThree, dampingFraction: .pointEight), value: currentPageIndex)
            }
        }
        .gesture(
            DragGesture()
                .updating($dragOffset) { value, state, _ in
                    state = value.translation.width
                }
                .onEnded { value in
                    handleCarouselDragEnd(value)
                }
        )
        .frame(height: .twoHundred)
    }

    private var carouselNavigationButtons: some View {
        HStack {
            Button(action: handlePreviousPage) {
                ITTTImage.arrowLeft
                    .circleButtonStyle()
            }
            .padding(.leading, .ten)

            Spacer()

            Button(action: handleNextPage) {
                ITTTImage.arrowRight
                    .circleButtonStyle()
            }
            .padding(.trailing, .ten)
        }
        .frame(width: .twoHundred)
    }

    private var pageIndicators: some View {
        HStack(spacing: .eight) {
            ForEach(.zero..<numberOfGameModes, id: \.self) { index in
                Circle()
                    .fill(currentPageIndex == index ? Color(.colorPrimaryUser) : Color.white)
                    .frame(width: .eight, height: .eight)
            }
        }
    }

    private var lastScoreSection: some View {
        VStack(spacing: .ten) {
            Text(SC.lastScore)
                .font(.title2)
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

    // MARK: - Helper Methods

    private func handleCarouselDragEnd(_ value: DragGesture.Value) {
        var newPageIndex = currentPageIndex

        if value.translation.width < -dragThreshold {
            newPageIndex = (currentPageIndex + .one) % numberOfGameModes
        } else if value.translation.width > dragThreshold {
            newPageIndex = (currentPageIndex - .one + numberOfGameModes) % numberOfGameModes
        }

        withAnimation(.spring(response: .pointThree, dampingFraction: .pointEight)) {
            currentPageIndex = newPageIndex
            carouselOffset = .zero
        }
    }

    private func handlePreviousPage() {
        withAnimation {
            currentPageIndex = max(currentPageIndex - .one, .zero)
        }
    }

    private func handleNextPage() {
        withAnimation {
            currentPageIndex = min(currentPageIndex + .one, numberOfGameModes - .one)
        }
    }
}

// MARK: - Preview

#Preview {
    ITTTHomeMainView()
}
