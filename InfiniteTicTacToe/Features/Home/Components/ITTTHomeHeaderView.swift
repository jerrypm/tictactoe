//
//  ITTTHomeHeaderView.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 26/05/25.
//

import SwiftUI

public struct ITTTHomeHeaderView: View {
    let onSettingsPressed: () -> Void
    
    public var body: some View {
        HStack {
            ITTTImage.titleXOX
                .resizable()
                .scaledToFit()
                .frame(height: .thirtyTwo)

            Spacer()

            ITTTImage.settings
                .frame(height: .twentyFour)
                .onTapGesture {
                    onSettingsPressed()
                }
        }
        .padding(.horizontal)
        .padding(.top, .fifty)
    }
}
