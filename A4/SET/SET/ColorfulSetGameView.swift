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
        AspectVGrid(viewModel.cardsInPlay, aspectRatio: Constants.aspectRatio, minimumSize: Constants.minimumCardSize) {card in
            CardView(card)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
    }
    
    private struct Constants {
        static let aspectRatio: CGFloat = 3/2
        static let minimumCardSize = 70.0
    }
    
}

#Preview {
    ColorfulSetGameView(viewModel:  ColorfulSetGame())
}
