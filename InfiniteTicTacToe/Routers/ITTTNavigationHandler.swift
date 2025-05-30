//
//  ITTTNavigationHandler.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 29/05/25.
//

import SwiftUI

struct ITTTNavigationHandler: View {
    let destination: NavigationDestination

    var body: some View {
        switch destination {
        case .game:
            ITTTParentBoardView()
        case .settings:
            ITTTParentSettingsView()
        case .profile:
            ITTTProfileView()
        }
    }
}
