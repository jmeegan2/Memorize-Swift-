//
//  MemoryGame.swift
//  Memorize
//
//  Created by James Meegan on 4/11/23.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    private var indexOfTheOnlyFaceUpCard: Int?{
        get { return cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach {cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
   mutating func choose(_ card: Card) {
       if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isFaceUp
       {
           if let potentialMatchIndex = indexOfTheOnlyFaceUpCard {
               if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                   cards[chosenIndex].isMatched = true
                   cards[potentialMatchIndex].isMatched = true
               }
               cards[chosenIndex].isFaceUp = true
           } else {
               indexOfTheOnlyFaceUpCard = chosenIndex
           }
       }
    }
    
    // ? makes its an optional
    //goes through everycard to find same card with that value
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
            // add numberOfPairsOfCards x 2 cards to cards array
                        //O upto but not including numberOfPairsOfCards
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id:pairIndex*2))
            cards.append(Card(content: content, id:pairIndex*2+1))

        }
    }
    //Identifiable is a single var that is a single var that is used to identify this struct against other card structs 
    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        let id: Int

    }
}


extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
