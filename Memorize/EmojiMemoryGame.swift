//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by James Meegan on 4/11/23.
//

import SwiftUI


class EmojiMemoryGame {
    //type variable
    static let emojis = ["🚂","🚁","✈️","🚜","🚗","🏎","🛻","🦽","🚕","🚓","🚚","🦼","🚙","🚑","⛵️","🚌","🚒","🛥️","🛴","🚔","🚠","🚟","🚍","🚘"]

    //type function
   static func createMemoryGame() -> MemoryGame<String> {
            MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
                    emojis[pairIndex]
                }
        }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
}
