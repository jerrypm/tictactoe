//
//  ITTTGameResultModel.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 25/05/25.
//

import Foundation

enum StatusResult: String {
    case win = "Win"
    case lose = "Lose"
    case draw = "Draw"
}

struct ITTTGameResultModel: Identifiable {
    let id = UUID()
    let gameType: String
    let score: String
    let result: StatusResult
    let date: String
}
