//
//  SetGame.swift
//  SET
//
//  Created by Ryan Boyle on 7/21/24.
//

import Foundation

struct SetGame<CardSymbol> {
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var symbol: CardSymbol
        var isMatched: Bool = false
        var inPlay: Bool = false
    }
    
}
