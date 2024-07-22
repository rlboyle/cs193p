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

#Preview {
    ColorfulSetGameView(viewModel:  ColorfulSetGame())
}
