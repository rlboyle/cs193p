//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Ryan Boyle on 6/11/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("\(viewModel.themeName())!")
                .font(.largeTitle)
                .bold()
                cards
                    .animation(.default, value: viewModel.cards)

            HStack {
                Button("New Game") {
                    viewModel.reset()
                }
                Spacer()
                Text("Score: \(viewModel.score())")
                Spacer()
                Button("Shuffle") {
                    viewModel.shuffle()
                }
            }
        }
        .padding()
    }
    
    
    var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: 2/3, minimumSize: 80) { card in
            CardView(card)
                .aspectRatio(2/3, contentMode: .fit)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .foregroundColor(viewModel.themeColor())
    }
    
}


#Preview {
    EmojiMemoryGameView(viewModel:  EmojiMemoryGame())
}
