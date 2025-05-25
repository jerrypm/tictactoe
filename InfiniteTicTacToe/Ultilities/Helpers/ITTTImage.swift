//
//  ITTTImage.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 25/05/25.
//

import SwiftUI

enum ITTTImage {
    // MARK: Assets

    static var titleXOX: Image {
        return Image(SC.imageTitleXOX.value)
    }

    static var settings: Image {
        return Image(SC.icSettings.value)
    }

    // MARK: System

    static var arrowLeft: Image {
        return Image(systemName: SC.icChevronLeft.value)
    }

    static var arrowRight: Image {
        return Image(systemName: SC.icChevronRight.value)
    }
}
