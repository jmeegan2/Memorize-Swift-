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
    
            
            return ZStack(content: {
                    RoundedRectangle(cornerRadius: 20.0)
                    .stroke(lineWidth: 3)
                    .padding(.horizontal)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
                
                Text("Hello, CS193p").foregroundColor(Color.orange).padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            })
            // another view that behaves like a text
            //padding exist in all structs that behave like a view
            //padding is a view modifier
        
//
        }
}




















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
