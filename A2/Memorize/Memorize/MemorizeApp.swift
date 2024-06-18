//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ryan Boyle on 6/11/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
