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
    private(set) var selectedCards: [Int] = []
    
    
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
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cardsInPlay.firstIndex(where: { $0.id == card.id }) {
            if !cardsInPlay[chosenIndex].isSelected {
                cardsInPlay[chosenIndex].isSelected = true
                selectedCards.append(chosenIndex)
//                print(selectedCards)
                if selectedCards.count == 3 {
                    if match(card1: cardsInPlay[selectedCards[0]],
                             card2: cardsInPlay[selectedCards[1]],
                             card3: cardsInPlay[selectedCards[2]]) {
                        print("match!")
                        for index in selectedCards {
                            cardsInPlay[index].isMatched = true
                        }
                    }
                }
            } else {
                if let selectedIndex = cardsInPlay.firstIndex(where: { $0.id == card.id }) {
//                    print(selectedIndex)
                    selectedCards.removeAll(where: { $0 == selectedIndex })
                    cardsInPlay[chosenIndex].isSelected = false
                }
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
