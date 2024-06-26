//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ryan Boyle on 6/17/24.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
//    private static let emojis = ["🎃", "👻", "🧙", "☠️", "👽", "👹", "😈", "🤖", "🤡", "🦄", "🕷️", "🕸️", "🙀"]
//    private static let themes = [("Halloween", "Orange", 12, ["🎃", "👻", "🧙", "☠️", "👽", "👹", "😈", "🤖", "🤡", "🦄", "🕷️", "🕸️", "🙀"]),
//                                 ("Faces", "Blue", 6, ["😀", "😄", "😆", "🥲", "🤩", "😍", "🥳", "🧐"])]
    private static let themes = 
    [Theme(name: "Halloween", color: "Orange", numberOfPairsOfCards: 12, emojis: ["🎃", "👻", "🧙", "☠️", "👽", "👹", "😈", "🤖", "🤡", "🦄", "🕷️", "🕸️", "🙀"]),
     Theme(name: "Faces", color: "Blue", numberOfPairsOfCards: 6, emojis: ["😀", "😄", "😆", "🥲", "🤩", "😍", "🥳", "🧐"])]
    
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
    
    struct Theme {
        var name: String
        var color: String
        var numberOfPairsOfCards: Int
        var emojis: [String]
    }
    
}
