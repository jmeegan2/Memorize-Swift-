//
//  MemoryGame.swift
//  Memorize
//
//  Created by James Meegan on 4/11/23.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    private var indexOfTheOnlyFaceUpCard: Int?
    
    // ! after any optional will assume its in the some case for the optional and if not it crashes
    //mutating lets people know ur changing it 
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
               indexOfTheOnlyFaceUpCard = nil
           } else {
               for index in cards.indices {
                   cards[index].isFaceUp = false
               }
               indexOfTheOnlyFaceUpCard = chosenIndex
           }

           cards[chosenIndex].isFaceUp.toggle()
       }
        print("\(cards)")
    }
    
    // ? makes its an optional
    //goes through everycard to find same card with that value
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
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
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int

    }
}
