//
//  home.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 01/03/25.
//

import SwiftUI

struct InfiXoxGameView: View {
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
    
    var body: some View {
        ZStack {
            // Background color
            Color(hex: "3B4438")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // App header
                HStack {
                    Text("Infixox")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                    
                    // Logo elements
                    Text("x")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(Color(hex: "7FBA00"))
                    
                    Text("o")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(Color(hex: "E86C13"))
                    
                    Text("x")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(Color(hex: "7FBA00"))
                    
                    Spacer()
                    
                    // Settings button
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Game Mode label
                Text("Game Mode")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                // Game mode carousel
                ZStack {
                    // Left game mode card (partially visible)
                    gameCard(isMiddle: false)
                        .offset(x: -130)
                    
                    // Right game mode card (partially visible)
                    gameCard(isMiddle: false)
                        .offset(x: 130)
                    
                    // Center game mode card
                    gameCard(isMiddle: true)
                        .frame(width: 200, height: 200)
                    
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
                }
                
                // Page indicators
                HStack(spacing: 8) {
                    ForEach(0..<3) { index in
                        Circle()
                            .fill(currentPage == index ? Color(hex: "E86C13") : Color.white)
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
    
    // Game mode card
    func gameCard(isMiddle: Bool) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(isMiddle ? Color.clear : Color(hex: "3B4438").opacity(0.8))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [Color(hex: "7FBA00"), Color(hex: "E86C13")]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: isMiddle ? 4 : 2
                        )
                )
            
            if isMiddle {
                VStack {
                    HStack {
                        // Player icon
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 32, height: 32)
                            
                            Image(systemName: "person.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        // Computer icon
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 32, height: 32)
                            
                            Image(systemName: "desktopcomputer")
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal, 30)
                    
                    // VS text
                    Text("VS")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, -16)
                        .padding(.bottom, -20)
                    
                    // X icon
                    Text("X")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(Color(hex: "7FBA00"))
                    
                    // O icon
                    Text("O")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(Color(hex: "E86C13"))
                        .offset(y: -30)
                }
            }
        }
        .frame(width: isMiddle ? 200 : 160, height: isMiddle ? 200 : 160)
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
                        .fill(game.result == "Win" ? Color(hex: "00A36C") : Color(hex: "DE3163"))
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
