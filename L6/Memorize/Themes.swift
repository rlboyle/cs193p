//
//  Themes.swift
//  Memorize
//
//  Created by Ryan Boyle on 6/27/24.
//

import Foundation

struct Theme {
    let name: String
    let color: String
    let numberOfPairsOfCards: Int?
    let emojis: [String]
}

let themes: Array<Theme> = [

Theme(
    name: "Halloween",
    color: "orange",
    numberOfPairsOfCards: 12,
    emojis: ["🎃", "👻", "🧙", "☠️", "👽", "👹", "😈", "🤖", "🤡", "🦄", "🕷️", "🕸️", "🙀"]),
 
Theme(
    name: "Faces",
    color: "blue",
    numberOfPairsOfCards: 6,
    emojis: ["😀", "😄", "😆", "🥲", "🤩", "😍", "🥳", "🧐"]),

Theme(name: "Animals",
      color: "green",
      numberOfPairsOfCards: 8,
      emojis: ["🐶", "🐱", "🐭", "🦊", "🐼", "🐯", "🐰", "🐒", "🐣", "🦆"]),

Theme(name: "People",
      color: "red",
      numberOfPairsOfCards: nil,
      emojis: ["👮‍♀️", "👷‍♀️", "💂‍♀️", "👩‍⚕️", "👩‍🌾", "👨‍🍳", "🧑‍🎓", "👩‍🎤", "🧑‍🏫", "👩‍💼", "🧑‍🔬", "🧑‍🚒"]),

Theme(name: "Flags", 
      color: "purple",
      numberOfPairsOfCards: 4,
      emojis: ["🇦🇫", "🇦🇽", "🇩🇿", "🇦🇺", "🇧🇩"]),

Theme(name: "Food",
      color: "brown",
      numberOfPairsOfCards: 5,
      emojis: ["🥯", "🍔", "🌽", "🍳", "🍕", "🥩", "🥞"])
 
 ]
