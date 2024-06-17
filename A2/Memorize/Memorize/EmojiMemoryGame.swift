//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ryan Boyle on 6/17/24.
//

import SwiftUI


class EmojiMemoryGame {
    private static let emojis = ["🎃", "🎃", "👻", "👻", "🧙", "🧙", "😈", "😈", "☠️", "☠️", "👽", "👽", "👹", "👹"]
        
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 4) {pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
            
        }
    }
    
    private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        return model.choose(card: card)
    }
}
