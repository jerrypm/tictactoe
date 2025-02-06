//
//  CellView.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 05/12/24.
//
import SwiftUI

struct CellView: View {
    let cell: Cell
    let action: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.blue.opacity(0.3))
            Text(cell.value ?? "")
                .font(.largeTitle)
                .bold()
        }
        .frame(width: 50, height: 50)
        .onTapGesture {
            action()
        }
    }
}
