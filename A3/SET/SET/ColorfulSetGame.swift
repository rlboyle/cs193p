//
//  ColorfulSetGame.swift
//  SET
//
//  Created by Ryan Boyle on 7/21/24.
//

import SwiftUI

extension Shape {
    @ViewBuilder func applyShading(_ shading: ColorfulSetGame.SymbolShadings) -> some View {
        switch shading {
        case .empty: self.stroke(lineWidth: 4)
        case .solid: self.opacity(1)
        case .striped: self.opacity(0.4)
        }
    }
}

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
                        symbols.append(Symbol(color: symbolColor, shape: symbolShape, quantity: symbolQuantity, shading: symbolShading))
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
            switch self.shape {
            case .squiggle: Rectangle().applyShading(self.shading)
            case .diamond: Circle().applyShading(self.shading)
            case .oval: Ellipse().applyShading(self.shading)
            }
        }
        
        func getColor() -> Color {
            switch self.color {
            case .red: .red
            case .green: .green
            case .blue: .blue
            }
        }
        
        func numberOfShapesToMake() -> Int {
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
