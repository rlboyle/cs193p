//
//  SETApp.swift
//  SET
//
//  Created by Ryan Boyle on 7/11/24.
//

import SwiftUI

@main
struct SETApp: App {
    @StateObject var game = ColorfulSetGame()
    var body: some Scene {
        WindowGroup {
            ColorfulSetGameView(viewModel: game)
        }
    }
}
