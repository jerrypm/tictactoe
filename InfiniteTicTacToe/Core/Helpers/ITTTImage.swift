//
//  ITTTImage.swift
//  InfiniteTicTacToe
//
//  Created by Jeri Purnama Maulid on 25/05/25.
//

import SwiftUI

enum ITTTImage {
    // MARK: Assets
    
    static var back: Image {
        return Image(SC.icBack.value)
    }

    static var titleXOX: Image {
        return Image(SC.imageTitleXOX.value)
    }

    static var settings: Image {
        return Image(SC.icSettings.value)
    }

    static var leftArrow: Image {
        return Image(SC.icLeftArrow.value)
    }

    static var rightArrow: Image {
        return Image(SC.icRightArrow.value)
    }
    
    static var humanImage: Image {
        return Image(SC.imageUser.value)
    }
    
    static var aiImage: Image {
        return Image(SC.imageAI.value)
    }
    
    static var cross: Image {
        return Image(SC.imageCross.value)
    }
    
    static var ellipse: Image {
        return Image(SC.imageEllipse.value)
    }
    

    // MARK: System

    static var arrowLeft: Image {
        return Image(systemName: SC.icChevronLeft.value)
    }

    static var arrowRight: Image {
        return Image(systemName: SC.icChevronRight.value)
    }
}
