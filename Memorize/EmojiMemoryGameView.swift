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
// Onto lecture 6: Protocols Shapes https://www.youtube.com/watch?v=Og9gXZpbKWo
// stopping points 24:00min, 29:12, 38:30 (ur working on aspectVGrid)
import SwiftUI  //made by apple and ships with all apple devices

//keywords in magenta like struct, ContentView is just the name, ": View" struct will behave like a view
//View has alot of functionality but there are certain responsibilities when you are a view
struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
//            ScrollView{
//                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
//                    ForEach(game.cards) { card in
        AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
            CardView(card: card)
                .aspectRatio(2/3, contentMode: .fit)
                .onTapGesture {
                    game.choose(card)
                }
        })
                       
//                    }
//                }
//            }
            .foregroundColor(.green)
        .padding(.horizontal)
    }
}

struct CardView :View {
   let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                //use let when defining constants
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    //modifier
                    //           example of type inference Color.white -> .white
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        })
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min( size.width, size.height) * DrawingConstants.fontScale)
    }
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
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
