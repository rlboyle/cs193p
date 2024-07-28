//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Ryan Boyle on 6/11/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    typealias Card = MemoryGame<String>.Card
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
            Text("\(viewModel.themeName())!")
                .font(.largeTitle)
                .bold()
                cards

            HStack {
                newGame
                Spacer()
                score
                Spacer()
                shuffle
            }
        }
        .padding()
    }
    
    var newGame: some View {
        Button("New Game") {
            viewModel.reset()
        }
    }
    
    var score: some View {
        Text("Score: \(viewModel.score())")
            .animation(nil)
    }
    
    var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                viewModel.shuffle()
            }
        }
    }
    
    var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: 2/3, minimumSize: 80) { card in
            CardView(card)
                .padding(spacing)
                .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                .onTapGesture {
                    withAnimation {
                        viewModel.choose(card)
                    }
                }
        }
        .foregroundColor(viewModel.themeColor())
    }
    
    private func scoreChange(causedBy card: Card) -> Int {
        return 0
    }
    
}


#Preview {
    EmojiMemoryGameView(viewModel:  EmojiMemoryGame())
}
