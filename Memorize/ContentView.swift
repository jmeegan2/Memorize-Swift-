//
//  ContentView.swift
//  Memorize
//
//  Created by James Meegan on 3/2/23.
//
// Onto Lecture 3: MVVM and the Swift type system
// stopping point: 10min, 20:52, 24:11 (lot of notes), 46:45, 1:05:47, 1:25:04
// Onto lecture 4: Memorize Game Logic
// stopping point: 9:30
//https://www.youtube.com/watch?v=oWZOFSYS5GE
import SwiftUI  //made by apple and ships with all apple devices

//keywords in magenta like struct, ContentView is just the name, ": View" struct will behave like a view
//View has alot of functionality but there are certain responsibilities when you are a view
struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView{
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))], spacing: 10) {
                    ForEach(viewModel.cards, id: \.self) { card in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.green)
        }
        .padding(.horizontal)
    }
}

struct CardView :View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            //use let when defining constants
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                //modifier
                //           example of type inference Color.white -> .white
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
    
}
