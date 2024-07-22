//
//  ColorfulSetGame.swift
//  SET
//
//  Created by Ryan Boyle on 7/21/24.
//

import SwiftUI

class ColorfulSetGame: ObservableObject {
    
    typealias Card = SetGame<String>.Card
    
    let symbolColors = ["red", "green", "blue"]
    let symbolShapes = ["rectangle", "diamond", "oval"]
    let symbolShapeQuantities = [1, 2, 3]
    let symbolShadings = ["empty", "light", "solid"]
    
    @Published private var model = createSetGame()
    
    private static func createSetGame() -> SetGame<String> {
        return SetGame()
    }
    
    func cardsInPlay() -> [Card] {
        return model.cardsInPlay
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
}
