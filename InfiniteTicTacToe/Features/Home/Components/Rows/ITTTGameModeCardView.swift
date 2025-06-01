//
//  ITTTGameModeCardView.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 02/03/25.
//

import SwiftUI

struct ITTTGameModeCardView: View {
    let isMiddle: Bool
    var onTap: (() -> Void)? = nil

    var body: some View {
        ZStack {
            Image(SC.imageGameMode.value)
                .resizable()
                .scaledToFill()
                .frame(width: isMiddle ? .twoHundred : .hundredSixty, height: isMiddle ? .twoHundred : .hundredSixty)
                .clipShape(RoundedRectangle(cornerRadius: .twenty))
                .overlay(
                    RoundedRectangle(cornerRadius: .twenty)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [Color(.colorPrimaryAi), Color(.colorPrimaryUser)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: isMiddle ? .four : .two
                        )
                )

            if isMiddle {
                VStack(spacing: .sixteen) {
                    HStack {
                        // Player icon
                        ITTTImage.humanImage
                            .frame(width: .twentyFour, height: .twentyFour)

                        Spacer()
                    }
                    .padding(.horizontal, .thirtyTwo)

                    // VS text
                    Text(SC.vs)
                        .font(.system(size: .fortyEight, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, -.sixteen)
                        .padding(.bottom, -.twenty)

                    HStack {
                        Spacer()

                        // Computer icon
                        ITTTImage.aiImage
                            .font(.system(size: .eighteen))
                    }
                    .padding(.horizontal, .thirtyTwo)
                }
            }
        }
        .frame(width: isMiddle ? .twoHundred : .hundredSixty, height: isMiddle ? .twoHundred : .hundredSixty)
        .onTapGesture {
            if isMiddle, let action = onTap {
                action()
            }
        }
    }
}

#Preview {
    ITTTGameModeCardView(isMiddle: true)
        .background(Color.black)
}
