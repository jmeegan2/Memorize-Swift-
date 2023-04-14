//
//  MemoryGame.swift
//  Memorize
//
//  Created by James Meegan on 4/11/23.
//

import Foundation


struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
            // add numberOfPairsOfCards x 2 cards to cards array
                        //O upto but not including numberOfPairsOfCards
        for pairIndex in 0..<numberOfPairsOfCards {
            var content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))

        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
