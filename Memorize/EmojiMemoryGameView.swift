//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Jackson Barnes on 7/1/20.
//  Copyright © 2020 Jackson Barnes. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(.orange)
            .font(Font.largeTitle)
    }
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View{
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.00).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.00).stroke(lineWidth: 3)
                Text(card.content)
            } else{
                RoundedRectangle(cornerRadius: 10.00).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
