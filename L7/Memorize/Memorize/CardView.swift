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
                Pie(endAngle: .degrees(240))
                    .opacity(0.4)
                    .overlay(
                        Text(card.content)
                            .font(.system(size: Constants.FontSize.largest))
                            .minimumScaleFactor(Constants.FontSize.scaleFactor)
                            .aspectRatio(1, contentMode: .fit)
                            .padding(5)
                    )
                    .padding(Constants.inset)
                    .cardify(isFaceUp: card.isFaceUp)
                    .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
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

#Preview {
    CardView(CardView.Card(content: "X", id: "test1"))
        .padding()
        .foregroundStyle(.green)
}
