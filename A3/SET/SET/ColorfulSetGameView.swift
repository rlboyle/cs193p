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
            Text("SET!")
                .font(.largeTitle)
                .bold()
            ScrollView {
                
            }
            Button("Deal Three More Cards") {
                
            }
        }
        .padding()
    }
}

struct CardView: View {
    let card: ColorfulSetGame.Card
    
    @ViewBuilder var drawableCardSymbol: some View {
        var shape = card.symbol.drawableShape()
        shape = card.symbol.applyColor(to: shape)
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
            }
        }
    }
    
    
}

#Preview {
    ColorfulSetGameView(viewModel:  ColorfulSetGame())
}
