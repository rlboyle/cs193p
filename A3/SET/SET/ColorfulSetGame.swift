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
        for symbolColor in SymbolColors.allCases {
            for symbolShape in SymbolShapes.allCases {
                for symbolQuantity in SymbolQuantities.allCases {
                    for symbolShading in SymbolShadings.allCases {
                        symbols.append(Symbol(color: symbolColor, shape: symbolShape, Quantity: symbolQuantity, shading: symbolShading))
                        numberOfCardsInDeck += 1
                    }
                }
            }
        }
        return Game(totalNumberOfCards: numberOfCardsInDeck, numberOfCardsToShow: 12) { index in
            return symbols[index]
        }
    }
    
    func cardsInPlay() -> [Card] {
        return model.cardsInPlay
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    struct Symbol {
        let color: SymbolColors
        let shape: SymbolShapes
        let Quantity: SymbolQuantities
        let shading: SymbolShadings
    }
    
    enum SymbolColors: CaseIterable {
        case red
        case green
        case blue
    }
    
    enum SymbolShapes: CaseIterable {
        case rectange
        case diamond
        case oval
    }
    
    enum SymbolQuantities: CaseIterable {
        case one
        case two
        case three
    }
    
    enum SymbolShadings: CaseIterable {
        case empty
        case striped
        case solid
    }
    
}
