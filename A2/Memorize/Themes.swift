//
//  Themes.swift
//  Memorize
//
//  Created by Ryan Boyle on 6/27/24.
//

import Foundation

struct Theme {
    var name: String
    var color: String
    var numberOfPairsOfCards: Int
    var emojis: [String]
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
      numberOfPairsOfCards: 10,
      emojis: ["👮‍♀️", "👷‍♀️", "💂‍♀️", "👩‍⚕️", "👩‍🌾", "👨‍🍳", "🧑‍🎓", "👩‍🎤", "🧑‍🏫", "👩‍💼", "🧑‍🔬", "🧑‍🚒"]),

Theme(name: "Flags", 
      color: "purple",
      numberOfPairsOfCards: 3,
      emojis: ["🇦🇫", "🇦🇽", "🇩🇿", "🇦🇺", "🇧🇩"]),

Theme(name: "Food",
      color: "brown",
      numberOfPairsOfCards: 5,
      emojis: ["🥯", "🍔", "🌽", "🍳", "🍕", "🥩", "🥞"])
 
 ]
