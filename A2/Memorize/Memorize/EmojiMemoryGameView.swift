//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Ryan Boyle on 6/11/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame
    
    @State var emojis = [""]
    
    @State var color: Color = .blue
    
    let themes = [["😀", "😀", "☺️", "☺️", "😡", "😡", "🫡", "🫡", "😭", "😭", "🥸", "🥸", "🫢", "🫢", "😆", "😆"],
                  ["🎃", "🎃", "👻", "👻", "🧙", "🧙", "😈", "😈", "☠️", "☠️", "👽", "👽", "👹", "👹"],
                  ["🐹", "🐹", "🐱", "🐱", "🐶", "🐶", "🐭", "🐭", "🐰", "🐰", "🦊", "🦊"]]
    
    let theme_names = ["Faces", "Scary", "Animals"]
    let theme_symbols = ["face.smiling", "exclamationmark.triangle.fill", "pawprint.fill"]
    let theme_colors: [Color] = [.blue, .orange, .green]
    
    
//    @State var cardCount = 0
    
    var body: some View {
        VStack {
            title
            ScrollView {
                cards
            }
            Spacer()
            cardThemeAdjusters
        }
        .padding()
    }
    
    var title: some View {
        Text("Memorize!").font(.largeTitle)
    }
    
    var cardThemeAdjusters: some View {
        HStack {
            Spacer()
            ForEach(0..<themes.count, id: \.self) {index in
                themeAdjust(to: themes[index], icon: theme_symbols[index], name: theme_names[index], th_color: theme_colors[index])
                Spacer()
            }
        }
    }
    
    func themeAdjust(to array: Array<String>, icon: String, name: String, th_color: Color) -> some View {
        Button(action: {
            let random = 2*Int.random(in: 2..<array.count/2)
//            cardCount = random
            emojis = Array(array[0..<random]).shuffled()
            color = th_color
        }, label: {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                base.frame(width: 60, height: 60)
                VStack {
                    Image(systemName: icon)
                        .font(.body)
                        .foregroundStyle(.white)
                    Text(name)
                        .font(.footnote)
                        .foregroundStyle(.white)
                }
            }
        })
    }
    
    func bestWidth(numCards: Int) -> CGFloat {
        if numCards <= 4 {
            return 150.0
        } else if numCards <= 8 {
            return 100
        } else if numCards <= 16 {
            return 80
        } else {
            return 60
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: bestWidth(numCards: emojis.count), maximum: bestWidth(numCards: emojis.count)))]) {
            if emojis.count > 1 {
                ForEach(emojis.indices, id: \.self) {index in
                    CardView(content: emojis[index])
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
        .foregroundColor(color)
    }
    
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content).font(.largeTitle)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
    }
}







#Preview {
    EmojiMemoryGameView()
}
