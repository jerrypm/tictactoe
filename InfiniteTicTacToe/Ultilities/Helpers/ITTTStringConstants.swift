//
//  Constants.swift
//  InfiniteTicTacToe
//
//  Created by JPM on 25/02/25.
//

import Foundation

typealias SC = ITTTStringConstant

enum ITTTStringConstant: String {
    // MARK: - Empty & Tab

    case empty = ""
    case dash = "-"

    // MARK: - Images or assets

    case icSettings = "ic_settings"
    case icBack = "ic_back"
    case icChevronLeft = "chevron.left"
    case icChevronRight = "chevron.right"

    case imageTitleXOX = "image-titleXOX"
    case imageVS = "image-vs"
    case imageAI = "image-ai"
    case imageUser = "image-user"
    case imageGameMode = "image-game-mode"

    var value: String {
        return rawValue
    }
}

extension ITTTStringConstant {
    static let strYouWinRound: String = "You Win This Round!"
    static let strAIWinRound: String = "AI Wins This Round!"

    static let strYouWinGame: String = "You Win The Game!"
    static let strAIWinGame: String = "AI Wins The Game!"

    static let strYourTurn: String = "Your Turn (X)"
    static let strAITurn: String = "AI Turn (O)"

    static let gameMode = "Game Mode"
    static let lastScore = "Last Score"
    static let newGame = "New Game"
    static let resetRound = "Reset Round"
    static let vs = "VS"
    static let xText = "X"
    static let oText = "O"
}
