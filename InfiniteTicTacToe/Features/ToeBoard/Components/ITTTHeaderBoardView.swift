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

    // MARK: -  Body

    var body: some View {
        VStack {
            Text("Toe")
                .font(.system(size: .thirtySix, weight: .bold, design: .rounded))
                .foregroundColor(.primary)

            HStack {
                Text("You: \(viewModel.humanScore)/3")
                    .foregroundColor(.blue)
                Spacer()
                Text("AI: \(viewModel.aiScore)/3")
                    .foregroundColor(.red)
            }
            .font(.system(size: .twenty, weight: .medium, design: .rounded))
        }
    }
}
