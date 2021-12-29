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
    
    var emojis = ["🚌", "🚎", "🚒", "🚚", "🦈", "🦆", "🦁", "🛵", "🚜", "🏯", "⚓️", "✈️", "🚠", "🚀", "🛳"]
    @State var emojiCount = 4
    // In functional programming (at least in SwiftUI here), the varibale like this is not stored
    // in memory. Instead it will run the function of it and return a value that matches the type
    // (here Text is a View struct).
    // why not just set body: Text?
    // Since it might get more complicated when your code grows.
    var body: some View { // To build a Lego house, you need "some" Lege furniture :)
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) {emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                removeCard
                Spacer()
                addCard
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var addCard: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }

    var removeCard: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
}

// We want more small views rather than few large views.
struct CardView: View {
    
    var content: String
    @State var isFaceUp: Bool = true // @State: create a pointer that look at the value (means state will change..?)
    
    var body: some View {
        ZStack { // This stack views together, the return type is more than ZStack btw.
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle) // return Text, which "return" is saved to look cleaner.
            }
            else {
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
        MemorizedView()
            .preferredColorScheme(.dark)
        MemorizedView()
            .preferredColorScheme(.light)
    }
}
