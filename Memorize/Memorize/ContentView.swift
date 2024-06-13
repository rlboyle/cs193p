//
//  ContentView.swift
//  Memorize
//
//  Created by Ryan Boyle on 6/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["😀", "😀", "☺️", "☺️", "😡", "😡", "🫡", "🫡", "😭", "😭", "🥸", "🥸", "🫢", "🫢", "😆", "😆"].shuffled()
    
    let themes = [["😀", "😀", "☺️", "☺️", "😡", "😡", "🫡", "🫡", "😭", "😭", "🥸", "🥸", "🫢", "🫢", "😆", "😆"],
                  ["🎃", "🎃", "👻", "👻", "🧙", "🧙", "😈", "😈", "☠️", "☠️", "👽", "👽", "👹", "👹"],
                  ["🐹", "🐹", "🐱", "🐱", "🐶", "🐶", "🐭", "🐭", "🐰", "🐰", "🦊", "🦊"]]
    
    let theme_names = ["Faces", "Scary", "Animals"]
    
    @State var cardCount: Int = 12
    
    var body: some View {
        VStack {
            title
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
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
                themeAdjust(to: themes[index], emoji: themes[index][0], name: theme_names[index])
                Spacer()
            }
        }
    }
    
    func themeAdjust(to array: Array<String>, emoji: String, name: String) -> some View {
        Button(action: {
            if cardCount > array.count {
                cardCount = array.count
            }
            emojis = array.shuffled()
        }, label: {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                base.frame(width: 60, height: 60)
                VStack {
                    Text(emoji)
                        .font(.body)
                    Text(name)
                        .font(.footnote)
                        .foregroundStyle(.white)
                }
            }
        })
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardThemeAdjusters
            cardAdder
        }
        //.imageScale(.large)
        .font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
            ForEach(0..<cardCount, id: \.self) {index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}







#Preview {
    ContentView()
}
