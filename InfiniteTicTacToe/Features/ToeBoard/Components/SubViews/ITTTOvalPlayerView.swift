//
//  ITTTOvalPlayerView.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 30/05/25.
//

import SwiftUI

struct ITTTOvalPlayerView: View {
    let playerImage: Image
    let toeImage: Image
    let score: Int
    let isHuman: Bool
    
    var body: some View {
        ZStack {
            backgroundOval
            playerCardView
        }
    }
    
    // Background oval dengan shadow
    private var backgroundOval: some View {
        RoundedRectangle(cornerRadius: 40)
            .fill(Color.colorBackgroundLight)
            .frame(width: 80, height: 165)
            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
    }
    
    // player card
    private var playerCardView: some View {
        VStack(spacing: 0) {
            // White oval container
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.white)
                .frame(width: 80, height: 130)
                .overlay(avatarAndToeView)
            
            Spacer()
                .frame(height: 8)
            
            playerScoreText
                .padding(.bottom, 8)
        }
    }
    
    private var avatarAndToeView: some View {
        VStack(spacing: 16) {
            // Player avatar circle
            ZStack {
                Circle()
                    .fill(Color.colorBackgroundLight)
                    .frame(width: 60, height: 60)
                
                playerImage
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
            }
            
            // tic tac toe image
            toeImage
                .frame(width: 12, height: 12)
                .padding(.bottom, 16)
        }
        .padding(.top, 8)
    }
    
    // Score number
    private var playerScoreText: some View {
        Text("\(score)")
            .font(.system(size: 24, weight: .bold, design: .rounded))
            .foregroundColor(.white)
    }
}
