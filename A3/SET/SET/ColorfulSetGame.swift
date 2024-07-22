//
//  ColorfulSetGame.swift
//  SET
//
//  Created by Ryan Boyle on 7/21/24.
//

import SwiftUI

class ColorfulSetGame: ObservableObject {
    
    private static func createSetGame() -> SetGame {
        return SetGame()
    }
    
    @Published private var model = createSetGame()
    
}
