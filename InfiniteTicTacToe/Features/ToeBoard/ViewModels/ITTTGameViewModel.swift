//
//  ITTTGameViewModel.swift
//  InfiniteTicTacToe
//
//  Created by JPM on 05/12/24.
//

import SwiftUI

class ITTTGameViewModel: ObservableObject {
    @Published var board = Array(repeating: SC.empty.value, count: .nine)
    @Published var moveHistory: [(index: Int, symbol: String)] = []
    @Published var isHumanTurn: Bool = true
    @Published var statusMessage = SC.strYourTurn
    @Published var humanScore: Int = .zero
    @Published var aiScore: Int = .zero
    @Published var gameOver: Bool = false
    
    private let winningCombinations = ITTTMockData.winningCombinations
    
    func countSymbols(_ symbol: String) -> Int {
        return board.filter { $0 == symbol }.count
    }
    
    func handleHumanMove(index: Int) {
        if countSymbols(.xText) >= .three {
            if let oldestIndex = getOldestMoveIndex(symbol: .xText) {
                board[oldestIndex] = .empty
                moveHistory = moveHistory.filter { $0.index != oldestIndex }
            }
        }
        makeMove(index: index, symbol: .xText)
    }
    
    private func getOldestMoveIndex(symbol: String) -> Int? {
        return moveHistory.first(where: { $0.symbol == symbol })?.index
    }
    
    func makeMove(index: Int, symbol: String) {
        board[index] = symbol
        moveHistory.append((index: index, symbol: symbol))
        
        if checkWinner(symbol: symbol) {
            if symbol == .xText {
                humanScore += .one
                statusMessage = SC.strYouWinRound
                
                if humanScore >= .three {
                    statusMessage = SC.strYouWinGame
                    gameOver = true
                    return
                }
            } else {
                aiScore += .one
                statusMessage = SC.strAIWinRound
                
                if aiScore >= .three {
                    statusMessage = SC.strAIWinGame
                    gameOver = true
                    return
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .onePointFive) {
                self.resetRound()
            }
        } else {
            statusMessage = isHumanTurn ? SC.strAITurn : SC.strYourTurn
        }
        
        isHumanTurn.toggle()
        if !isHumanTurn && !gameOver {
            DispatchQueue.main.asyncAfter(deadline: .now() + .pointFive) {
                self.aiMove()
            }
        }
    }
    
    func aiMove() {
        let availableMoves = board.indices.filter { board[$0] == .empty }
        guard !availableMoves.isEmpty else { return }
        
        if countSymbols(.oText) >= .three {
            if let oldestIndex = getOldestMoveIndex(symbol: .oText) {
                board[oldestIndex] = .empty
                moveHistory = moveHistory.filter { $0.index != oldestIndex }
            }
        }
        
        if let winningMove = findWinningMove(symbol: .oText) {
            makeMove(index: winningMove, symbol: .oText)
        } else if let blockingMove = findWinningMove(symbol: .xText) {
            makeMove(index: blockingMove, symbol: .oText)
        } else {
            let randomMove = availableMoves.randomElement()!
            makeMove(index: randomMove, symbol: .oText)
        }
    }
    
    private func findWinningMove(symbol: String) -> Int? {
        for combo in winningCombinations {
            let symbols = combo.map { board[$0] }
            let count = symbols.filter { $0 == symbol }.count
            let empty = symbols.filter { $0 == .empty }.count
            
            if count == .two && empty == .one {
                return combo[symbols.firstIndex(of: .empty)!]
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
        board = Array(repeating: .empty, count: .nine)
        moveHistory.removeAll()
        isHumanTurn = true
        statusMessage = SC.strYourTurn
    }
    
    func resetGame() {
        board = Array(repeating: .empty, count: .nine)
        moveHistory.removeAll()
        isHumanTurn = true
        statusMessage = SC.strYourTurn
        humanScore = .zero
        aiScore = .zero
        gameOver = false
    }
}
