//
//  MemorizeApp.swift
//  Memorize
//
//  Created by James Meegan on 3/2/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
