//
//  Constants.swift
//  InfiniteTicTacToe
//
//  Created by JPM on 25/02/25.
//

import Foundation

typealias SC = StringConstant

enum StringConstant: String {
    case empty = ""
    case dash = "-"

    var value: String {
        return rawValue
    }
}

extension StringConstant {
    static let strYouWinRound: String = "You Win This Round!"
    static let strAIWinRound: String = "AI Wins This Round!"

    static let strYouWinGame: String = "You Win The Game!"
    static let strAIWinGame: String = "AI Wins The Game!"

    static let strYourTurn: String = "Your Turn (X)"
    static let strAITurn: String = "AI Turn (O)"
}
