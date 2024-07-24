//
//  SetGame.swift
//  SET
//
//  Created by Ryan Boyle on 7/21/24.
//

import Foundation

struct SetGame<Feature: Equatable> {
    
    typealias CardSymbol = [Feature]
    
    private(set) var deck: [Card]
    private(set) var cardsInPlay: [Card]
    private(set) var cardsCurrentlySelected = 0
    
    
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
            if cardsInPlay[chosenIndex].isSelected {
                cardsInPlay[chosenIndex].isSelected = false
                cardsCurrentlySelected -= 1
            } else {
                cardsInPlay[chosenIndex].isSelected = true
                cardsCurrentlySelected += 1
            }
            
        
        }
    }
    
    mutating func dealThreeMoreCards() {
        for _ in 0..<3 {
            if let cardToDeal = deck.popLast() {
                cardsInPlay.append(cardToDeal)
            }
        }
    }
    
    func match(card1: Card, card2: Card, card3: Card) -> Bool {
        for index in 0..<card1.symbol.count {
            if !((card1.symbol[index] == card2.symbol[index] && card2.symbol[index] == card3.symbol[index] && card1.symbol[index] == card3.symbol[index])
            || (card1.symbol[index] != card2.symbol[index] && card2.symbol[index] != card3.symbol[index] && card1.symbol[index] != card3.symbol[index])){
                return false
            }
        }
        return true
    }
    
    struct Card: Identifiable {
        let symbol: [Feature]
        var id: Int
        var isMatched = false
        var isSelected = false
    }
    
}
