//
//  Symbol.swift
//  SET
//
//  Created by Ryan Boyle on 7/23/24.
//

import SwiftUI

extension Shape {
    @ViewBuilder func applyShading(_ shading: Symbol.SymbolShadings) -> some View {
        switch shading {
        case .empty: self.stroke(lineWidth: 4)
        case .solid: self.opacity(1)
        case .striped: self.opacity(0.4)
        }
    }
}

struct Symbol {
    let color: SymbolColors
    let shape: SymbolShapes
    let quantity: SymbolQuantities
    let shading: SymbolShadings
    
    @ViewBuilder func drawableShape(aspectRatio: CGFloat) -> some View {
        switch self.shape {
        case .squiggle: Rectangle()
                .applyShading(self.shading)
                .aspectRatio(aspectRatio, contentMode: .fit)
        case .diamond: Diamond()
                .applyShading(self.shading)
                .aspectRatio(aspectRatio, contentMode: .fit)
        case .oval: Ellipse()
                .applyShading(self.shading)
                .aspectRatio(aspectRatio, contentMode: .fit)
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
