//
//  ColorfulSetGame.swift
//  SET
//
//  Created by Ryan Boyle on 7/21/24.
//

import SwiftUI

class ColorfulSetGame: ObservableObject {
    
    
    typealias Game = SetGame<Symbol>
    typealias Card = Game.Card
    
    @Published private var model = createSetGame()
    
    private static func createSetGame() -> Game {
        var symbols: [Symbol] = []
        var numberOfCardsInDeck = 0
        for symbolColor in Symbol.SymbolColors.allCases {
            for symbolShape in Symbol.SymbolShapes.allCases {
                for symbolQuantity in Symbol.SymbolQuantities.allCases {
                    for symbolShading in Symbol.SymbolShadings.allCases {
                        symbols.append(Symbol(color: symbolColor, shape: symbolShape, quantity: symbolQuantity, shading: symbolShading))
                        numberOfCardsInDeck += 1
                    }
                }
            }
        }
        return Game(totalNumberOfCards: numberOfCardsInDeck, numberOfCardsToShow: 12) { index in
            return symbols[index]
        }
    }
    
    var cardsInPlay: [Card] {
        return model.cardsInPlay
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
}
