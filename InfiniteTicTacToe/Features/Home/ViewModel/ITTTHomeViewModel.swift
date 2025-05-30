//
//  ITTTHomeViewModel.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 09/04/25.
//

import Foundation

class ITTTHomeViewModel: ObservableObject {
    let gameHistory = ITTTMockData.gameResults

    @Published var showSettings = false
    @Published var showBoard = false

    func openSettings() {
        showSettings = true
    }

    func openBoard() {
        showBoard = true
    }
}
