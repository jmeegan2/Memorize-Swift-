//
//  ContentView.swift
//  Memorize
//
//  Created by James Meegan on 3/2/23.
//
// Onto Lecture 3: MVVM and the Swift type system
//stopping point: 10min
// https://www.youtube.com/watch?v=--qKOhdgJAs

import SwiftUI  //made by apple and ships with all apple devices

//keywords in magenta like struct, ContentView is just the name, ": View" struct will behave like a view
//View has alot of functionality but there are certain responsibilities when you are a view
struct ContentView: View {
   var emojis = ["🚂","🚁","✈️","🚜","🚗","🏎","🛻","🦽","🚕","🚓","🚚","🦼","🚙","🚑","⛵️","🚌","🚒","🛥️","🛴","🚔","🚠","🚟","🚍","🚘"]
    //after declaring its a view u have to specify its a view again with a var
    // a function
    @State var emojiCount = 20
    
    var body: some View {
        VStack {
            ScrollView{
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))], spacing: 10) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    var remove: some View {
        Button{
            //this is what gives the button the ability to remove cards
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            //In order to the add the image I went to SF for ios devs and found the images
            Image(systemName: "minus.circle")
        }
    }
    var add: some View {
        Button{
            
            //this is what gives the button the ability to add cards
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct CardView :View {
    var content: String
   @State var isFaceUp : Bool = true
    
    var body: some View {
        ZStack {
            //use let when defining constants
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                //modifier
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
    
}
