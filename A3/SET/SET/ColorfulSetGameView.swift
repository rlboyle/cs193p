//
//  ColorfulSetGameView.swift
//  SET
//
//  Created by Ryan Boyle on 7/11/24.
//

import SwiftUI

struct ColorfulSetGameView: View {
    
    @ObservedObject var viewModel: ColorfulSetGame
    
    var body: some View {
        VStack {
            Text("SET!")
                .font(.largeTitle)
                .bold()
            cards
            Button("Deal Three More Cards") {
                
            }
        }
        .padding()
    }
    
    var cards: some View {
        AspectVGrid(viewModel.cardsInPlay, aspectRatio: 3/2) {card in
            CardView(card)
        }
    }
    
}

struct CardView: View {
    let card: ColorfulSetGame.Card
    
    init(_ card: ColorfulSetGame.Card) {
        self.card = card
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
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let aspectRatio = (geometry.size.width/geometry.size.height)/3
                let base = RoundedRectangle(cornerRadius: 12)
                Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                }
                drawableCardSymbol(aspectRatio: aspectRatio)
            }
        }
    }
    
    
}

#Preview {
    ColorfulSetGameView(viewModel:  ColorfulSetGame())
}
