//
//  CardView.swift
//  SET
//
//  Created by Ryan Boyle on 7/25/24.
//

import SwiftUI

struct CardView: View {
    let card: ColorfulSetGame.Card
    
    var borderColor: Color {
        if card.card.isMatched {
            .green
        } else if card.card.isSelected {
            .red
        } else {
            .black
        }
    }
    
    init(_ card: ColorfulSetGame.Card) {
        self.card = card
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let aspectRatioSymbol = (geometry.size.width/geometry.size.height)/Constants.symbolToCardARFactor
                let base = RoundedRectangle(cornerRadius: Constants.cardCornerRadius)
                base.fill(.white)
                    .opacity(card.isFaceUp ? 0 : 1)
                    .overlay(
                        base
                            .strokeBorder(lineWidth: Constants.borderLineWidth)
                            .foregroundStyle(borderColor)
                            .animation(.linear(duration: 0), value: borderColor)
                    )
                if card.isFaceUp {
                    drawableCardSymbol(aspectRatio: aspectRatioSymbol)
                }
            }
        }
    }
    
    @ViewBuilder func drawableCardSymbol(aspectRatio: CGFloat) -> some View {
        let shape = card.symbol.drawableShape(aspectRatio: aspectRatio)
            .foregroundStyle(card.symbol.getColor())
        HStack {
            ForEach(0..<card.symbol.numberOfShapesToMake(), id: \.self) {_ in
                shape
            }
        }
        .padding()
    }
    
    private struct Constants {
        static let cardCornerRadius: CGFloat = 12
        static let symbolToCardARFactor: CGFloat = 3
        static let borderLineWidth: CGFloat = 3
    }
    
}
