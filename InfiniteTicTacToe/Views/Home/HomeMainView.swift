//
//  HomeMainView.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 01/03/25.
//

import SwiftUI

struct HomeMainView: View {
    // Sample data for game history
    let gameHistory = [
        GameResult(type: "Player VS AI", score: "0:3", result: "Lose", date: "28 Feb 2025"),
        GameResult(type: "Player VS Player", score: "2:1", result: "Win", date: "16 Feb 2025"),
        GameResult(type: "Player VS AI", score: "1:2", result: "Lose", date: "01 Feb 2025"),
        GameResult(type: "Player VS AI", score: "2:1", result: "Win", date: "24 Jan 2025"),
        GameResult(type: "Player VS Player", score: "2:1", result: "Win", date: "14 Dec 2024")
    ]
    
    // Current page for carousel
    @State private var currentPage = 0
    private let numberOfCards = 3
    @State private var offset: CGFloat = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            // Background color
            LinearGradientView()
            
            VStack(spacing: 20) {
                // App header
                HStack {
                    Image(SC.imageTitleXOX.value)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 32)
                    
                    Spacer()
                    
                    // Settings button
                    Image(SC.icSettings.value)
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Game Mode label
                Text(SC.gameMode)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                // Game mode carousel
                ZStack {
                    ForEach(0..<3) { index in
                        GameModeCardView(isMiddle: currentPage == index)
                            .offset(x: CGFloat(index - currentPage) * 260 + offset + dragOffset)
                            .zIndex(currentPage == index ? 1 : 0)
                    }
                }
                .gesture(
                    DragGesture()
                        .updating($dragOffset) { value, state, _ in
                            state = value.translation.width
                        }
                        .onEnded { value in
                            let threshold: CGFloat = 50
                            var newPage = currentPage
                            
                            if value.translation.width < -threshold {
                                newPage = (currentPage + 1) % numberOfCards
                            } else if value.translation.width > threshold {
                                newPage = (currentPage - 1 + numberOfCards) % numberOfCards
                            }
                            
                            withAnimation(.spring()) {
                                currentPage = newPage
                                offset = 0
                            }
                        }
                )
                .frame(height: 200)
                
                // Navigation arrows
                HStack {
                    Button(action: {
                        withAnimation {
                            currentPage = max(currentPage - 1, 0)
                        }
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .background(
                                Circle()
                                    .fill(Color.black.opacity(0.4))
                                    .frame(width: 36, height: 36)
                            )
                    }
                    .padding(.leading, 10)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            currentPage = min(currentPage + 1, 2)
                        }
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .background(
                                Circle()
                                    .fill(Color.black.opacity(0.4))
                                    .frame(width: 36, height: 36)
                            )
                    }
                    .padding(.trailing, 10)
                }
                .frame(width: 240)
                
                // Page indicators
                HStack(spacing: 8) {
                    ForEach(0 ..< 3) { index in
                        Circle()
                            .fill(currentPage == index ? Color(.colorPrimaryUser) : Color.white)
                            .frame(width: 8, height: 8)
                    }
                }
                    
                Spacer()
                    
                // Last Score section
                VStack(spacing: 10) {
                    Text("Last Score")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                        
                    VStack(spacing: 0) {
                        ForEach(gameHistory) { game in
                            GameHistoryRow(game: game)
                        }
                    }
                    .background(Color.black.opacity(0.35))
                    .cornerRadius(12)
                    .padding(.horizontal)
                }
                    
                Spacer()
            }
        }
    }
}

// Game history row component
struct GameHistoryRow: View {
    let game: GameResult
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(game.type)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                
                Text(game.date)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            
            Spacer()
            
            Text(game.score)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
            Spacer()
            
            Text(game.result)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(
                    Capsule()
                        .fill(game.result == "Win" ? Color(.colorPrimaryAi) : Color(.colorPrimaryUser))
                )
                .padding(.trailing, 16)
        }
        .frame(height: 60)
        .background(Color.clear)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.gray.opacity(0.3)),
            alignment: .bottom
        )
    }
}

// Model for game history data
struct GameResult: Identifiable {
    let id = UUID()
    let type: String
    let score: String
    let result: String
    let date: String
}

#Preview {
    HomeMainView()
}
