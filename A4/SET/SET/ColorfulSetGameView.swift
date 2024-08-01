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
            HStack {
                deck
                Spacer()
                dealMoreCards
                Spacer()
                discard
            }
            Spacer()
                
        }
        .padding()
    }
    
    var dealMoreCards: some View {
        Button("Deal Three Cards") {
            withAnimation(.easeInOut(duration: 0.5)) {
                viewModel.dealThreeMoreCards()
            }
        }
        .disabled(viewModel.deck.isEmpty)
    }
    
    @Namespace private var dealingNamespace
    @Namespace private var discardNamespace
    
    var deck: some View {
        ZStack {
            ForEach (viewModel.deck) { card in
                CardView(card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
            }
        }
        .frame(width: Constants.deckWidth, height: Constants.deckWidth/Constants.aspectRatio)
    }
    
    var discard: some View {
        ZStack {
            ForEach (viewModel.discardPile) { card in
                CardView(card)
                    .matchedGeometryEffect(id: card.id, in: discardNamespace)
            }
        }
        .frame(width: Constants.deckWidth, height: Constants.deckWidth/Constants.aspectRatio)
    }
    
    var cards: some View {
        AspectVGrid(viewModel.cardsInPlay, aspectRatio: Constants.aspectRatio, minimumSize: Constants.minimumCardSize) {card in
            CardView(card)
                .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                .matchedGeometryEffect(id: card.id, in: discardNamespace)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        viewModel.choose(card)
                    }
                }
        }
    }
    
    private struct Constants {
        static let aspectRatio: CGFloat = 3/2
        static let minimumCardSize = 80.0
        static let deckWidth:CGFloat = 75
    }
    
}

#Preview {
    ColorfulSetGameView(viewModel:  ColorfulSetGame())
}
