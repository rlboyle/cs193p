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
            deck.append(Card(symbol: cardSymbol, id: cardIndex))
        }
        deck.shuffle()
        for _ in 0..<numberOfCardsToShow {
            if let cardToPlay = deck.popLast() {
                cardsInPlay.append(cardToPlay)
            }
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating func dealThreeMoreCards() {
        for _ in 0..<3 {
            if let cardToDeal = deck.popLast() {
                cardsInPlay.append(cardToDeal)
            }
        }
    }
    
    struct Card: Identifiable {
        let symbol: CardSymbol
        var id: Int
        var isMatched: Bool = false
    }
    
}
