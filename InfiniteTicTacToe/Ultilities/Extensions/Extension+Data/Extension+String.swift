//
//  Extension+String.swift
//  InfiniteTicTacToe
//
//  Created by JPM on 25/02/25.
//

import Foundation

public extension String {
    static var empty: String {
        return SC.empty.value
    }

    static var dash: String {
        return SC.dash.value
    }

    static var xText: String {
        return SC.xText
    }

    static var oText: String {
        return SC.oText
    }
}
