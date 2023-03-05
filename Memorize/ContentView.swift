//
//  ContentView.swift
//  Memorize
//
//  Created by James Meegan on 3/2/23.
//

import SwiftUI  //made by apple and ships with all apple devices

//keywords in magenta like struct, ContentView is just the name, ": View" struct will behave like a view
//View has alot of functionality but there are certain responsibilities when you are a view
struct ContentView: View {
    //after declaring its a view u have to specify its a view again with a var
    // a function
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct CardView :View {
    var isFaceUp : Bool
    
    var body: some View {
        ZStack {
            if isFaceUp {
                //modifier
                RoundedRectangle(cornerRadius: 20.0)
                    .fill()
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(lineWidth: 3)
                Text("✈️")
                    .font(.largeTitle)
            } else {
                
            }
        }
    }
}




// Z stacks on top, H is horizontal view

// stopped at 14:02 https://www.youtube.com/watch?v=3lahkdHEhW8















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
    
}
