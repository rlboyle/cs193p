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
    
    @ViewBuilder var drawableCardSymbol: some View {
        let shape = card.symbol.drawableShape()
            .foregroundStyle(card.symbol.getColor())
        HStack {
            ForEach(0..<card.symbol.numberOfShapesToMake(), id: \.self) {_ in
                shape
                    .padding(6)
            }
        }
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
            }
            drawableCardSymbol
        }
    }
    
    
}

#Preview {
    ColorfulSetGameView(viewModel:  ColorfulSetGame())
}
