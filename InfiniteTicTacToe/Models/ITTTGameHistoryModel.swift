//
//  ITTTGameHistoryModel.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 25/05/25.
//

import Foundation

struct ITTTGameHistoryModel: Identifiable {
    let id: UUID
    let date: Date
    let winner: String
    let moveCount: Int
    let boardSize: Int
}
