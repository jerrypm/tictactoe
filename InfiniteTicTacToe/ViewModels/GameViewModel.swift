//
//  GameViewModel.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 05/12/24.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published var cells: [Cell] = []
    @Published var currentPlayer: String = "X"
    @Published var gameStatus: String = "Player X's Turn"
    
    let gridSize = 3
    private var moveHistory: [(row: Int, column: Int)] = []
    
    init() {
        resetGame()
    }
    
    func resetGame() {
        cells = (0..<gridSize * gridSize).map { index in
            Cell(id: index,
                 row: index / gridSize,
                 column: index % gridSize,
                 value: "")
        }
        currentPlayer = "X"
        gameStatus = "Player X's Turn"
        moveHistory.removeAll()
    }
    
    func makeMove(row: Int, column: Int) {
        guard let index = cells.firstIndex(where: { $0.row == row && $0.column == column }),
              ((cells[index].value?.isEmpty) != nil),  // Remove optional chaining
              !checkWinner() else { return }
        
        cells[index].value = currentPlayer
        moveHistory.append((row: row, column: column))
        
        if checkWinner() {
            gameStatus = "Player \(currentPlayer) Wins!"
        } else if cells.allSatisfy({ (($0.value?.isEmpty) == nil) }) {  // Remove optional chaining
            gameStatus = "It's a Draw!"
        } else {
            currentPlayer = currentPlayer == "X" ? "O" : "X"
            gameStatus = "Player \(currentPlayer)'s Turn"
        }
    }
    
    func undoMove() {
        guard let lastMove = moveHistory.popLast(),
              let index = cells.firstIndex(where: { $0.row == lastMove.row && $0.column == lastMove.column }) else { return }
        
        cells[index].value = ""
        currentPlayer = currentPlayer == "X" ? "O" : "X"
        gameStatus = "Player \(currentPlayer)'s Turn"
    }
    
    func checkWinner() -> Bool {
        // Check rows
        for row in 0..<gridSize {
            if let first = cells.first(where: { $0.row == row && $0.column == 0 })?.value,
               !first.isEmpty,
               cells.filter({ $0.row == row }).allSatisfy({ $0.value == first }) {
                return true
            }
        }
        
        // Check columns
        for column in 0..<gridSize {
            if let first = cells.first(where: { $0.row == 0 && $0.column == column })?.value,
               !first.isEmpty,
               cells.filter({ $0.column == column }).allSatisfy({ $0.value == first }) {
                return true
            }
        }
        
        // Check diagonals
        let diagonal1 = (0..<gridSize).map { i in cells.first(where: { $0.row == i && $0.column == i })?.value ?? "" }
        let diagonal2 = (0..<gridSize).map { i in cells.first(where: { $0.row == i && $0.column == (gridSize - 1 - i) })?.value ?? "" }
        
        if let first = diagonal1.first, !first.isEmpty, diagonal1.allSatisfy({ $0 == first }) {
            return true
        }
        
        if let first = diagonal2.first, !first.isEmpty, diagonal2.allSatisfy({ $0 == first }) {
            return true
        }
        
        return false
    }
}
