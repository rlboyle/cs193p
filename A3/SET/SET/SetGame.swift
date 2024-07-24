//
//  SetGame.swift
//  SET
//
//  Created by Ryan Boyle on 7/21/24.
//

import Foundation

struct SetGame<Feature: Equatable> {
    
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
    
    private func matchCheck(card1: Card, card2: Card, card3: Card) -> Bool {
        return true
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cardsInPlay.firstIndex(where: {$0.id == card.id}) {
            cardsInPlay[chosenIndex].isSelected.toggle()
        }
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
        var isMatched = false
        var isSelected = false
    }
    
    struct CardSymbol {
        let feature1: Feature
        let feature2: Feature
        let feature3: Feature
        let feature4: Feature
    }
    
}
