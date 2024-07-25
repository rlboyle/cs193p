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
            ZStack {
                Text("SET!")
                    .font(.largeTitle)
                    .bold()
                    .frame(alignment: .center)
                HStack {
                    Spacer()
                    Button("New Game") {
                        viewModel.newGame()
                    }
                }
            }
            cards
            Button("Deal Three Cards") {
                viewModel.dealThreeMoreCards()
            }
            .disabled(viewModel.deck.isEmpty)
            Spacer()
                
        }
        .padding()
    }
    
    var cards: some View {
        AspectVGrid(viewModel.cardsInPlay, aspectRatio: 3/2) {card in
            CardView(card)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
    }
    
}

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
                let aspectRatio = (geometry.size.width/geometry.size.height)/3
                let base = RoundedRectangle(cornerRadius: 12)
                    base.strokeBorder(lineWidth: 3)
                    .foregroundStyle(borderColor)
                        .background(
                            base.fill(.white)
                        )
                drawableCardSymbol(aspectRatio: aspectRatio)
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

}

#Preview {
    ColorfulSetGameView(viewModel:  ColorfulSetGame())
}
