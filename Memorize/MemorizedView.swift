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
    
    var emojis = ["🚌", "🚎", "🚒", "🚚"]
    
    // In functional programming (at least in SwiftUI here), the varibale like this is not stored
    // in memory. Instead it will run the function of it and return a value that matches the type
    // (here Text is a View struct).
    // why not just set body: Text?
    // Since it might get more complicated when your code grows.
    var body: some View { // To build a Lego house, you need "some" Lege furniture :)
        HStack { // View combiner
            ForEach(emojis[0..<4], id: \.self) {emoji in
                CardView(content: emoji)
            }
        }
        .padding(.horizontal)
        .foregroundColor(.red) // Defualt color of the whole stack, can be override respecitvely.
    }
}


// We want more small views rather than few large views.
struct CardView: View {
    @State var isFaceUp = false // @State ???
    var content: String
    
    var body: some View {
        ZStack { // This stack views together, the return type is more than ZStack btw.
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3).foregroundColor(Color.orange)
                Text(content).font(.largeTitle) // return Text, which "return" is saved to look cleaner.
            }
            else {
                shape.fill().foregroundColor(.blue)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemorizedView()
            .preferredColorScheme(.dark)
    }
}
