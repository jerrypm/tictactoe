//
//  ITTTHomeGameModeView.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 26/05/25.
//

import SwiftUI

struct ITTTHomeGameModeView: View {
    // MARK: - State Properties

    @State private var currentPageIndex: Int = .zero
    @State private var carouselOffset: CGFloat = .zero
    let onNavigateToGame: () -> Void

    // MARK: - Animation Control

    @State private var isAnimating: Bool = false
    @State private var animationID = UUID()

    // MARK: - Constants

    private let numberOfGameModes: Int = .three
    private let cardSpacing: CGFloat = .twoHundredForty
    private let dragThreshold: CGFloat = .fifty

    // MARK: - Gesture State

    @GestureState private var dragOffset: CGFloat = .zero

    var body: some View {
        VStack {
            ZStack {
                gameModeCarousel
                carouselNavigationButtons
                    .padding(.horizontal, .ten)
            }
            pageIndicators
                .padding(.top, .twelve)
        }
    }

    private var gameModeCarousel: some View {
        ZStack {
            ForEach(.zero ..< numberOfGameModes, id: \.self) { index in
                ITTTGameModeCardView(isMiddle: currentPageIndex == index) {
                    if index == .zero {
                        onNavigateToGame()
                    }
                }
                .offset(x: CGFloat(index - currentPageIndex) * cardSpacing + carouselOffset + (isAnimating ? .zero : dragOffset))
                .zIndex(currentPageIndex == index ? 1 : .zero)
            }
        }
        .animation(.spring(response: .pointThree, dampingFraction: .pointEight), value: animationID)
        .gesture(
            DragGesture()
                .updating($dragOffset) { value, state, _ in
                    if !isAnimating {
                        state = value.translation.width
                    }
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
                ITTTImage.leftArrow
            }
            .disabled(isAnimating)
            .opacity(currentPageIndex == .zero ? .zero : 1)

            Spacer()
                .frame(width: cardSpacing)

            Button(action: handleNextPage) {
                ITTTImage.rightArrow
            }
            .disabled(isAnimating)
            .opacity(currentPageIndex == numberOfGameModes - .one ? .zero : 1)
        }
        .padding(.top, .twelve)
    }

    private var pageIndicators: some View {
        HStack(spacing: .eight) {
            ForEach(.zero ..< numberOfGameModes, id: \.self) { index in
                Circle()
                    .fill(currentPageIndex == index ? Color(.colorPrimaryUser) : Color.white)
                    .frame(width: .eight, height: .eight)
            }
        }
    }
}

extension ITTTHomeGameModeView {
    // MARK: - Helper Methods

    private func handleCarouselDragEnd(_ value: DragGesture.Value) {
        guard !isAnimating else { return }
        var newPageIndex = currentPageIndex

        if value.translation.width < -dragThreshold {
            newPageIndex = (currentPageIndex + .one) % numberOfGameModes
        } else if value.translation.width > dragThreshold {
            newPageIndex = (currentPageIndex - .one + numberOfGameModes) % numberOfGameModes
        }

        guard newPageIndex != currentPageIndex else { return }

        performAnimation {
            currentPageIndex = newPageIndex
            carouselOffset = .zero
        }
    }

    // Previous Page
    private func handlePreviousPage() {
        guard !isAnimating, currentPageIndex > .zero else { return }

        performAnimation {
            currentPageIndex = max(currentPageIndex - .one, .zero)
        }
    }

    // Next Page
    private func handleNextPage() {
        guard !isAnimating, currentPageIndex < numberOfGameModes - .one else { return }

        performAnimation {
            currentPageIndex = min(currentPageIndex + .one, numberOfGameModes - .one)
        }
    }

    // MARK: - Animation Helper

    private func performAnimation(_ changes: @escaping () -> Void) {
        isAnimating = true

        // Reset animation state
        animationID = UUID()

        // Perform changes
        changes()

        // Reset animation lock after animation duration
        DispatchQueue.main.asyncAfter(deadline: .now() + .pointSix) { // Slightly longer than animation duration
            isAnimating = false
        }
    }
}
