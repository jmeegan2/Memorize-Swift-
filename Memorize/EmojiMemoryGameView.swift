//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by James Meegan on 3/2/23.
//
// Onto Lecture 3: MVVM and the Swift type system
// stopping point: 10min, 20:52, 24:11 (lot of notes), 46:45, 1:05:47, 1:25:04
// Onto lecture 4: Memorize Game Logic
// stopping point: 9:30, 30:11, 38:20, 1:02:57
// Onto lecture 5: Propertiees 
import SwiftUI  //made by apple and ships with all apple devices

//keywords in magenta like struct, ContentView is just the name, ": View" struct will behave like a view
//View has alot of functionality but there are certain responsibilities when you are a view
struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(game.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.green)
        .padding(.horizontal)
    }
}

struct CardView :View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            //use let when defining constants
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                //modifier
                //           example of type inference Color.white -> .white
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
    
}
