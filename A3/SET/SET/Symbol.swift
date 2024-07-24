//
//  Symbol.swift
//  SET
//
//  Created by Ryan Boyle on 7/23/24.
//

import SwiftUI

extension Shape {
    @ViewBuilder func applyShading(_ shading: Symbol.SymbolFeature) -> some View {
        switch shading {
        case .one: self.stroke(lineWidth: 4)
        case .two: self.opacity(1)
        case .three: self.opacity(0.4)
        }
    }
}

struct Symbol {
    
    typealias Game = SetGame<Symbol.SymbolFeature>
    
    let color: SymbolFeature
    let shape: SymbolFeature
    let quantity: SymbolFeature
    let shading: SymbolFeature
    
    @ViewBuilder func drawableShape(aspectRatio: CGFloat) -> some View {
        switch self.shape {
        case .one: Rectangle()
                .applyShading(self.shading)
                .aspectRatio(aspectRatio, contentMode: .fit)
        case .two: Diamond()
                .applyShading(self.shading)
                .aspectRatio(aspectRatio, contentMode: .fit)
        case .three: Ellipse()
                .applyShading(self.shading)
                .aspectRatio(aspectRatio, contentMode: .fit)
        }
    }
    
    func getColor() -> Color {
        switch self.color {
        case .one: .red
        case .two: .green
        case .three: .blue
        }
    }
    
    func numberOfShapesToMake() -> Int {
        switch self.quantity {
        case .one: 1
        case .two: 2
        case .three: 3
        }
    }
    
    enum SymbolFeature: CaseIterable {
        case one
        case two
        case three
    }
    
}
