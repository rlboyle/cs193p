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

let themes =

[Theme(
    name: "Halloween",
    color: "orange",
    numberOfPairsOfCards: 12,
    emojis: ["🎃", "👻", "🧙", "☠️", "👽", "👹", "😈", "🤖", "🤡", "🦄", "🕷️", "🕸️", "🙀"]),
 
 Theme(
    name: "Faces",
    color: "blue",
    numberOfPairsOfCards: 6,
    emojis: ["😀", "😄", "😆", "🥲", "🤩", "😍", "🥳", "🧐"])
 
 ]
