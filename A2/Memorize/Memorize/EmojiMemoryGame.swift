//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ryan Boyle on 6/17/24.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    let colorChoices: [String:Color] = ["orange": Color(.orange),
                                        "blue": Color(.blue),
                                        "green": Color(.green),
                                        "purple": Color(.purple),
                                        "red": Color(.red),
                                        "yellow": Color(.yellow),
                                        "brown": Color(.brown),
                                        "black": Color(.black),
                                        ]
    
    private static var currentTheme: Theme?
        
    private static func createMemoryGame() -> MemoryGame<String> {
        if let theme = themes.randomElement() {
            EmojiMemoryGame.currentTheme = theme
            let emojis = theme.emojis.shuffled()
            return MemoryGame(numberOfPairsOfCards: theme.numberOfPairsOfCards) {pairIndex in
                if emojis.indices.contains(pairIndex) {
                    return emojis[pairIndex]
                } else {
                    return "⁉️"
                }
                
            }
        }
        return MemoryGame(numberOfPairsOfCards: 0, cardContentFactory: {_ in ""})
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        return model.choose(card: card)
    }
    
    func reset() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    func themeName() -> String {
        if let theme = EmojiMemoryGame.currentTheme {
            return theme.name
        }
        return ""
    }
    
    func themeColor() -> Color? {
        if let theme = EmojiMemoryGame.currentTheme {
            return colorChoices[theme.color]
        }
        return nil
    }
    
    func score() -> Int {
        return model.score
    }
    
}
