//
//  Cell.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 05/12/24.
//

import Foundation

struct CellModel: Identifiable {
    let id: Int
    var row: Int
    var column: Int
    var value: String? // "X" or "O"
}
