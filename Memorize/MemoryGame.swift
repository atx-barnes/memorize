//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jackson Barnes on 9/23/20.
//  Copyright © 2020 Jackson Barnes. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    func choose(card: Card) {
        
        print("Card Choosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            
            let content = cardContentFactory(pairIndex)
            
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
    }
    
    struct Card: Identifiable {
        
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
