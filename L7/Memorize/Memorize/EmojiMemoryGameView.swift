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
    let aspectRatio: CGFloat = 2/3
    let deckWidth: CGFloat = 50
    
    var body: some View {
        VStack {
            ZStack {
                Text("\(viewModel.themeName)!")
                    .font(.largeTitle)
                    .bold()
                HStack {
                    Spacer()
                    newGame
                }
            }
                cards

            HStack {
                score
                Spacer()
                deck.foregroundStyle(viewModel.themeColor)
                Spacer()
                shuffle
            }
        }
        .padding()
    }
    
    var newGame: some View {
        Button("New Game") {
            viewModel.reset()
            dealt.removeAll()
        }
    }
    
    var score: some View {
        Text("Score: \(viewModel.score)")
            .animation(nil)
    }
    
    var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                viewModel.shuffle()
            }
        }
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: 2/3, minimumSize: 80) { card in
            if isDealt(card) {
                CardView(card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(.asymmetric(insertion: .identity, removal: .identity))
                    .padding(spacing)
                    .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                    .zIndex(scoreChange(causedBy: card) != 0 ? 100 : 0)
                    .onTapGesture {
                        choose(card)
                    }
            }
        }
        .foregroundStyle(viewModel.themeColor)
    }
    
    @State private var dealt = Set<Card.ID>()
    
    private func isDealt(_ card: Card) -> Bool {
        dealt.contains(card.id)
    }
    
    private var undealtCards: [Card] {
        viewModel.cards.filter { !isDealt($0) }
    }
    
    @Namespace private var dealingNamespace
    
    private var deck: some View {
        ZStack {
            ForEach(undealtCards) { card in
                CardView(card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
            }
        }
        .frame(width: deckWidth, height: deckWidth / aspectRatio)
        .onTapGesture {
            deal()
        }
    }
    
    private func deal() {
        var delay: TimeInterval = 0
        for card in viewModel.cards {
            withAnimation(.easeInOut(duration: 0.5).delay(delay)) {
                _ = dealt.insert(card.id)
            }
            delay += 0.1
        }
    }
    
    private func choose(_ card: Card) {
        withAnimation {
            let scoreBeforechoosing = viewModel.score
            viewModel.choose(card)
            let scoreChange = viewModel.score - scoreBeforechoosing
            lastScoreChange = (scoreChange, causedByCardID: card.id)
        }
    }
    
    @State private var lastScoreChange = (0, causedByCardID: "")
    
    private func scoreChange(causedBy card: Card) -> Int {
        let (amount, id) = lastScoreChange
        return card.id == id ? amount : 0
    }
    
}


#Preview {
    EmojiMemoryGameView(viewModel:  EmojiMemoryGame())
}
