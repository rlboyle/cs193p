//
//  CardView.swift
//  Memorize
//
//  Created by Ryan Boyle on 7/26/24.
//

import SwiftUI

struct CardView: View {
    
    typealias Card = MemoryGame<String>.Card

    
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        TimelineView(.animation) { timeline in
            if card.isFaceUp || !card.isMatched {
                Pie(endAngle: .degrees(card.bonusPercentRemaining * 360))
                    .opacity(0.4)
                    .overlay(cardContents).padding(Constants.inset)
                    .padding(Constants.inset)
                    .cardify(isFaceUp: card.isFaceUp)
                    .transition(.scale)
            } else {
                Color.clear
            }
        }
    }
    
    var cardContents: some View {
        Text(card.content)
            .font(.system(size: Constants.FontSize.largest))
            .minimumScaleFactor(Constants.FontSize.scaleFactor)
            .aspectRatio(1, contentMode: .fit)
            .rotationEffect(.degrees(card.isMatched ? 360 : 0))
            .animation(.spin(duration: 1), value: card.isMatched)
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor:CGFloat = smallest/largest
        }
        
    }
    
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: duration)
        .repeatForever(autoreverses: false)
//        .repeatCount(2, autoreverses: false)
    }
}

#Preview {
    CardView(CardView.Card(content: "X", id: "test1"))
        .padding()
        .foregroundStyle(.green)
}
