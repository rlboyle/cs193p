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
    
    private var matchPresent: Bool {
        for card in cardsInPlay {
            if card.isMatched {
                return true
            }
        }
        return false
    }
    
    private var selectedCards: [Card] {
        get {
            var ret: [Card] = []
            for card in cardsInPlay {
                if card.isSelected {
                    ret.append(card)
                }
            }
            return ret
        }
        
        set {
            for index in 0..<cardsInPlay.count {
                cardsInPlay[index].isSelected = false
            }
        }
        
    }
    
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
        
        // if chosen card is valid
        if let chosenIndex = getCardIndex(card) {
            
            // if the chosen card is not matched
            if !cardsInPlay[chosenIndex].isMatched {
                
                // if the chosen card is not selected
                if !cardsInPlay[chosenIndex].isSelected {
                    
                    cardsInPlay[chosenIndex].isSelected = true
                    
                    if selectedCards.count == 3 {
                        
                        // if a match is found, set matched to be true on all matched cards
                        if match(card1: selectedCards[0],
                                 card2: selectedCards[1],
                                 card3: selectedCards[2]) {
                            print("match!")
                            
                            for c in selectedCards {
                                if let selectedCardIndex = getCardIndex(c) {
                                    cardsInPlay[selectedCardIndex].isMatched = true
                                }
                            }
                            
                        }
                        
                    
                    } else if selectedCards.count > 3 {
                        
                        if matchPresent {
                            
                            var cardsToReplace: [Card] = []
                            for c in cardsInPlay {
                                if c.isMatched {
                                    print(c)
                                    cardsToReplace.append(c)
                                }
                            }
                            
                            for c in cardsToReplace {
                                if let poppedCard = deck.popLast() {
                                    print("replaced")
                                    replaceCard(c, with: poppedCard)
                                } else {
                                    removeCard(c)
                                }
                            }
                            
                        } else {
                            selectedCards = []
                            cardsInPlay[chosenIndex].isSelected = true
                        }
                    }
//                    print(selectedCards)
                    
                // if chosen card is already selected
                } else {
                    cardsInPlay[chosenIndex].isSelected = false
                }
            }
        }
    }
    
    mutating func removeCard(_ card: Card) {
        cardsInPlay.removeAll(where: { $0.id == card.id })
    }
    
    mutating func replaceCard(_ card: Card, with newCard: Card) {
        if let index = getCardIndex(card) {
            cardsInPlay[index] = newCard
        }
    }
    
    func getCardIndex(_  card: Card) -> Int? {
        if let index = cardsInPlay.firstIndex(where: { $0.id == card.id }) {
            return index
        }
        return nil
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
//            if !((card1.symbol[index] == card2.symbol[index] && card2.symbol[index] == card3.symbol[index] && card1.symbol[index] == card3.symbol[index])
//            || (card1.symbol[index] != card2.symbol[index] && card2.symbol[index] != card3.symbol[index] && card1.symbol[index] != card3.symbol[index])){
//                return false
//            }

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
