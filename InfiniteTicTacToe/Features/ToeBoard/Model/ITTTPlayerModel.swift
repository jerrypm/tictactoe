//
//  ITTTPlayerModel.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 25/05/25.
//

import Foundation

struct ITTTPlayerModel: Identifiable {
    let id: UUID
    let name: String
    let symbol: String
    var score: Int
}
