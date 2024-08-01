//
//  Symbol.swift
//  SET
//
//  Created by Ryan Boyle on 7/23/24.
//

import SwiftUI

extension Shape {
    @ViewBuilder func applyShading(_ shading: Symbol.SymbolFeature) -> some View {
        let borderLineWidth: CGFloat = 3
        let stripedOpacity: CGFloat = 0.3
        
        switch shading {
        case .one: self.stroke(lineWidth: borderLineWidth)
        case .two: self.opacity(1)
        case .three: self.opacity(stripedOpacity)
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
        case .one: Constants.colorOne
        case .two: Constants.colorTwo
        case .three: Constants.colorThree
        }
    }
    
    func numberOfShapesToMake() -> Int {
        switch self.quantity {
        case .one: Constants.oneShape
        case .two: Constants.twoShapes
        case .three: Constants.threeShapes
        }
    }
    
    enum SymbolFeature: CaseIterable {
        case one
        case two
        case three
    }
    
    private struct Constants {
        static let colorOne: Color = .red
        static let colorTwo: Color = .green
        static let colorThree: Color = .blue
        static let oneShape = 1
        static let twoShapes = 2
        static let threeShapes = 3
    }
    
}
