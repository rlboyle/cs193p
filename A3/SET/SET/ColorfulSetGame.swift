//
//  ColorfulSetGame.swift
//  SET
//
//  Created by Ryan Boyle on 7/21/24.
//

import SwiftUI

class ColorfulSetGame: ObservableObject {
    
    
    typealias Game = SetGame<Symbol>
    typealias Card = Game.Card
    
    @Published private var model = createSetGame()
    
    private static func createSetGame() -> Game {
        var symbols: [Symbol] = []
        var numberOfCardsInDeck = 0
        for symbolColor in SymbolColors.allCases {
            for symbolShape in SymbolShapes.allCases {
                for symbolQuantity in SymbolQuantities.allCases {
                    for symbolShading in SymbolShadings.allCases {
                        symbols.append(Symbol(color: symbolColor, shape: symbolShape, Quantity: symbolQuantity, shading: symbolShading))
                        numberOfCardsInDeck += 1
                    }
                }
            }
        }
        return Game(totalNumberOfCards: numberOfCardsInDeck, numberOfCardsToShow: 12) { index in
            return symbols[index]
        }
    }
    
    var cardsInPlay: [Card] {
        return model.cardsInPlay
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    struct Symbol {
        let color: SymbolColors
        let shape: SymbolShapes
        let quantity: SymbolQuantities
        let shading: SymbolShadings
        
        @ViewBuilder func drawableShape() -> some View {
            var shapeToDraw: View
            switch self.shape {
            case .squiggle: shapeToDraw = Rectangle()
            case .diamond: shapeToDraw = Circle()
            case .oval: shapeToDraw = Ellipse()
            }
            
            switch self.color {
            case .red: shape.foregroundColor(.red)
            case .green: shape.foregroundColor(.green)
            case .blue: shape.foregroundColor(.blue)
            }
            
        }
        
        func applyColor(to shape: some View) -> some View {
            switch self.color {
            case .red: shape.foregroundColor(.red)
            case .green: shape.foregroundColor(.green)
            case .blue: shape.foregroundColor(.blue)
            }
        }
        
        @ViewBuilder func applyShading(to shape: some Shape) -> some View {
            switch self.shading {
            case .empty: shape.stroke(lineWidth: 2)
            case .solid: shape
            case .striped: shape.opacity(0.3)
            }
        }
        
        func numberOfShapesToMake(_ shape: some Shape) -> Int {
            switch self.quantity {
            case .one: 1
            case .two: 2
            case .three: 3
            }
        }
        
    }
    
    enum SymbolShapes: CaseIterable {
        case squiggle
        case diamond
        case oval
    }
    
    enum SymbolColors: CaseIterable {
        case red
        case green
        case blue
    }
    
    enum SymbolShadings: CaseIterable {
        case empty
        case striped
        case solid
    }
    
    enum SymbolQuantities: CaseIterable {
        case one
        case two
        case three
    }
    
}
