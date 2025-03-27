//
//  GameCardView.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 02/03/25.
//

import SwiftUI

struct GameModeCardView: View {
    let isMiddle: Bool
    
    var body: some View {
        ZStack {
            Image(SC.imageGameMode.value)
                .resizable()
                .scaledToFill()
                .frame(width: isMiddle ? 200 : 160, height: isMiddle ? 200 : 160)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [Color(.colorPrimaryAi), Color(.colorPrimaryUser)]),
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
                        Image(SC.imageUser.value)
                            .frame(width: 24, height: 24)
                        
                        Spacer()
                            
                        // Computer icon
                        Image(SC.imageAI.value)
                            .font(.system(size: 18))
                    }
                    .padding(.horizontal, 30)
                        
                    // VS text
                    Text("VS")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, -16)
                        .padding(.bottom, -20)
                }
            }
        }
        .frame(width: isMiddle ? 200 : 160, height: isMiddle ? 200 : 160)
    }
}

#Preview {
    GameModeCardView(isMiddle: true)
        .background(Color.black)
}


