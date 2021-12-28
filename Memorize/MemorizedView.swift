//
//  ContentView.swift
//  Memorize
//
//  Created by Danny Chan on 2021/12/28.
//

import SwiftUI  // Not every file need UI, for instance the logic of a game

// In the UI, struct supports functional programming
// Use Object-oriented programming to hook up the logic and the UI
struct MemorizedView: View {
    // Declearing that our struct MemorizedView behave like View (and get all the functionality of View
    // And to behave like a View, this need the variable body showed below
    
    // In functional programming (at least in SwiftUI here), the varibale like this is not stored
    // in memory. Instead it will run the function of it and return a value that matches the type
    // (here Text is a View struct)
    // why not just set body: Text?
    // Since it might get more complicated when your code grows
    
    var body: some View { // To build a Lego house, you need "some" Lege furniture :)
        /*Text("Hello, Swift!") // return Text, which "return" is saved to look cleaner
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/) // this padding function return something like a View, but definitely not Text
            .foregroundColor(color: Color.orange) // or just (.orange), Swift is smart enough
         */
        RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 3).padding(.horizontal)
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemorizedView()
    }
}
