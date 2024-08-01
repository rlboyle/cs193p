//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ryan Boyle on 6/17/24.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
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
            var numberOfPairsToDisplay = Int.random(in: 2..<emojis.count)
            if let givenNumPairs = theme.numberOfPairsOfCards {
                if givenNumPairs > emojis.count { numberOfPairsToDisplay = emojis.count }
                if givenNumPairs < 2 { numberOfPairsToDisplay = 2}
            }
            return MemoryGame(numberOfPairsOfCards: numberOfPairsToDisplay) {pairIndex in
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
    
    var cards: Array<Card> {
        model.cards
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card: card)
    }
    
    func reset() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    var themeName: String {
        if let theme = EmojiMemoryGame.currentTheme {
            return theme.name
        }
        return ""
    }
    
    var themeColor: Color {
        if let theme = EmojiMemoryGame.currentTheme {
            if let returnColor = colorChoices[theme.color] {
                return returnColor
            }
        }
        return .black
    }
    
    var score: Int {
        model.score
    }
    
}
