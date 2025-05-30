import Foundation

/// A collection of mock data used throughout the app for previews and testing
enum ITTTMockData {
    // MARK: - Game History

    static let gameHistories: [ITTTGameHistoryModel] = [
        ITTTGameHistoryModel(
            id: UUID(),
            date: Date(),
            winner: "Player 1",
            moveCount: 9,
            boardSize: 3
        ),
        ITTTGameHistoryModel(
            id: UUID(),
            date: Date().addingTimeInterval(-3600),
            winner: "Player 2",
            moveCount: 7,
            boardSize: 3
        ),
        ITTTGameHistoryModel(
            id: UUID(),
            date: Date().addingTimeInterval(-7200),
            winner: "Draw",
            moveCount: 9,
            boardSize: 3
        )
    ]

    // MARK: - Game Results

    static let gameResults: [ITTTGameResultModel] = [
        ITTTGameResultModel(gameType: "Player VS AI", score: "0:3", result: .lose, date: "28 Feb 2025"),
        ITTTGameResultModel(gameType: "Player VS Player", score: "2:1", result: .win, date: "16 Feb 2025"),
        ITTTGameResultModel(gameType: "Player VS AI", score: "1:2", result: .lose, date: "01 Feb 2025"),
        ITTTGameResultModel(gameType: "Player VS AI", score: "2:1", result: .win, date: "24 Jan 2025"),
        ITTTGameResultModel(gameType: "Player VS Player", score: "2:1", result: .win, date: "14 Dec 2024")
    ]

    // MARK: - Player Data

    static let players: [ITTTPlayerModel] = [
        ITTTPlayerModel(id: UUID(), name: "Player 1", symbol: "X", score: 5),
        ITTTPlayerModel(id: UUID(), name: "Player 2", symbol: "O", score: 3)
    ]

    // MARK: - Game Settings

    static let defaultGameSettings = ITTTGameSettingsModel(
        boardSize: 3,
        isInfinite: false,
        timeLimit: 300,
        isSoundEnabled: true
    )

    // MARK: - Winning Combinations

    static let winningCombinations = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
        [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
        [0, 4, 8], [2, 4, 6] // Diagonals
    ]
}
