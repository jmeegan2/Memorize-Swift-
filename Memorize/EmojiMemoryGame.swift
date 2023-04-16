//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by James Meegan on 4/11/23.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    //type variable
    static let emojis = ["🚂","🚁","✈️","🚜","🚗","🏎","🛻","🦽","🚕","🚓","🚚","🦼","🚙","🚑","⛵️","🚌","🚒","🛥️","🛴","🚔","🚠","🚟","🚍","🚘"]

    //type function
   static func createMemoryGame() -> MemoryGame<String> {
            MemoryGame<String>(numberOfPairsOfCards: 3) { pairIndex in
                    emojis[pairIndex]
                }
        }
    
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
