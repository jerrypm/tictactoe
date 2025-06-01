//
//  ITTTHeaderBoardView.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 27/05/25.
//

import SwiftUI

struct ITTTHeaderBoardView: View {
    // MARK: - Properties
    
    @StateObject private var viewModel = ITTTGameViewModel()
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20) {
            // Timer di bagian atas
            Text("01:30")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            // Score section dengan avatar
            HStack(spacing: 40) {
                // Player 1 (Human)
                ITTTOvalPlayerView(
                    playerImage: ITTTImage.humanImage,
                    toeImage: ITTTImage.cross,
                    score: viewModel.humanScore,
                    isHuman: true
                )
                
                // VS text
                Text("VS")
                    .font(.system(size: 44, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                // Player 2 (AI)
                ITTTOvalPlayerView(
                    playerImage: ITTTImage.aiImage,
                    toeImage: ITTTImage.ellipse,
                    score: viewModel.aiScore,
                    isHuman: false
                )
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .cornerRadius(20)
    }
}

// MARK: - Preview

struct ITTTHeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ITTTHeaderBoardView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black)
    }
}
