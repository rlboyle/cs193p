//
//  ColorfulSetGame.swift
//  SET
//
//  Created by Ryan Boyle on 7/21/24.
//

import SwiftUI

class ColorfulSetGame: ObservableObject {
    
    
    typealias Game = SetGame<Symbol.SymbolFeature>
    
    @Published private var model = createSetGame()
    
    private static func createSetGame() -> Game {
        var symbols: [Game.CardSymbol] = []
        var numberOfCardsInDeck = 0
        for symbolColor in Symbol.SymbolFeature.allCases {
            for symbolShape in Symbol.SymbolFeature.allCases {
                for symbolQuantity in Symbol.SymbolFeature.allCases {
                    for symbolShading in Symbol.SymbolFeature.allCases {
                        symbols.append([symbolColor, symbolShape, symbolQuantity, symbolShading])
                        numberOfCardsInDeck += 1
                    }
                }
            }
        }
        return Game(totalNumberOfCards: numberOfCardsInDeck, numberOfCardsToShow: 12) { index in
            symbols[index]
        }
    }
    
    func newGame() {
        model = ColorfulSetGame.createSetGame()
    }
    
    var cardsInPlay: [Card] {
        var returnCards: [ColorfulSetGame.Card] = []
        for card in model.cardsInPlay {
            returnCards.append(Card(card))
        }
        return returnCards
    }
    
    var deck: [Card] {
        var returnCards: [ColorfulSetGame.Card] = []
        for card in model.deck {
            returnCards.append(Card(card))
        }
        return returnCards
    }
    
    func choose(_ card: Card) {
        model.choose(card.card)
    }
    
    func dealThreeMoreCards() {
        model.dealThreeMoreCards()
    }
    
    struct Card: Identifiable {
        let card: Game.Card
        let id: Int
        let symbol: Symbol
        
        init(_ card: Game.Card) {
            self.card = card
            self.id = card.id
            self.symbol = Symbol(color: card.symbol[0],
                                 shape: card.symbol[1],
                                 quantity: card.symbol[2],
                                 shading: card.symbol[3])
        }
        
    }
    
}
