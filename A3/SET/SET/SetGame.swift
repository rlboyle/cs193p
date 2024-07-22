//
//  SetGame.swift
//  SET
//
//  Created by Ryan Boyle on 7/21/24.
//

import Foundation

struct SetGame<CardSymbol> {
    
    private(set) var deck: [Card]
    private(set) var cardsInPlay: [Card]
    
    init(totalNumberOfCards: Int, numberOfCardsToShow: Int, cardContentFactory: (Int) -> CardSymbol) {
        deck = []
        cardsInPlay = []
        for cardIndex in 0..<totalNumberOfCards {
            let cardSymbol = cardContentFactory(cardIndex)
            deck.append(Card(symbol: cardSymbol))
        }
        deck.shuffle()
        for index in 0..<numberOfCardsToShow {
            if let cardToPlay = deck.popLast() {
                cardsInPlay.append(cardToPlay)
            }
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var symbol: CardSymbol
        var isMatched: Bool = false
    }
    
}
