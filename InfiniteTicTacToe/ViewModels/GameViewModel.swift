//
//  GameViewModel.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 05/12/24.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published var board = Array(repeating: "", count: 9)
    @Published var moveHistory: [(index: Int, symbol: String)] = []
    @Published var isHumanTurn = true
    @Published var statusMessage = "Your Turn (X)"
    @Published var humanScore = 0
    @Published var aiScore = 0
    @Published var gameOver = false
    
    private let winningCombinations = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
        [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
        [0, 4, 8], [2, 4, 6] // Diagonals
    ]
    
    func countSymbols(_ symbol: String) -> Int {
        return board.filter { $0 == symbol }.count
    }
    
    func handleHumanMove(index: Int) {
        if countSymbols("X") >= 3 {
            if let oldestIndex = getOldestMoveIndex(symbol: "X") {
                board[oldestIndex] = ""
                moveHistory = moveHistory.filter { $0.index != oldestIndex }
            }
        }
        makeMove(index: index, symbol: "X")
    }
    
    private func getOldestMoveIndex(symbol: String) -> Int? {
        return moveHistory.first(where: { $0.symbol == symbol })?.index
    }
    
    func makeMove(index: Int, symbol: String) {
        board[index] = symbol
        moveHistory.append((index: index, symbol: symbol))
        
        if checkWinner(symbol: symbol) {
            if symbol == "X" {
                humanScore += 1
                statusMessage = "You Win This Round!"
                
                if humanScore >= 3 {
                    statusMessage = "You Win The Game!"
                    gameOver = true
                    return
                }
            } else {
                aiScore += 1
                statusMessage = "AI Wins This Round!"
                
                if aiScore >= 3 {
                    statusMessage = "AI Wins The Game!"
                    gameOver = true
                    return
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.resetRound()
            }
        } else {
            statusMessage = isHumanTurn ? "AI's Turn" : "Your Turn (X)"
        }
        
        isHumanTurn.toggle()
        if !isHumanTurn && !gameOver {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.aiMove()
            }
        }
    }
    
    func aiMove() {
        let availableMoves = board.indices.filter { board[$0] == "" }
        guard !availableMoves.isEmpty else { return }
        
        if countSymbols("O") >= 3 {
            if let oldestIndex = getOldestMoveIndex(symbol: "O") {
                board[oldestIndex] = ""
                moveHistory = moveHistory.filter { $0.index != oldestIndex }
            }
        }
        
        if let winningMove = findWinningMove(symbol: "O") {
            makeMove(index: winningMove, symbol: "O")
        } else if let blockingMove = findWinningMove(symbol: "X") {
            makeMove(index: blockingMove, symbol: "O")
        } else {
            let randomMove = availableMoves.randomElement()!
            makeMove(index: randomMove, symbol: "O")
        }
    }
    
    private func findWinningMove(symbol: String) -> Int? {
        for combo in winningCombinations {
            let symbols = combo.map { board[$0] }
            let count = symbols.filter { $0 == symbol }.count
            let empty = symbols.filter { $0 == "" }.count
            
            if count == 2 && empty == 1 {
                return combo[symbols.firstIndex(of: "")!]
            }
        }
        return nil
    }
    
    private func checkWinner(symbol: String) -> Bool {
        for combo in winningCombinations {
            if combo.allSatisfy({ board[$0] == symbol }) {
                return true
            }
        }
        return false
    }
    
    func resetRound() {
        board = Array(repeating: "", count: 9)
        moveHistory.removeAll()
        isHumanTurn = true
        statusMessage = "Your Turn (X)"
    }
    
    func resetGame() {
        board = Array(repeating: "", count: 9)
        moveHistory.removeAll()
        isHumanTurn = true
        statusMessage = "Your Turn (X)"
        humanScore = 0
        aiScore = 0
        gameOver = false
    }
}
