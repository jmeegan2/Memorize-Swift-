//
//  MemorizeApp.swift
//  Memorize
//
//  Created by James Meegan on 3/2/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
