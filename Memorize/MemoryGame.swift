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
    
    mutating func choose(card: Card) {
        
        print("Card Choosen: \(card)")
        let choosenIndex: Int = self.index(of: card)
        cards[choosenIndex].isFaceUp = !cards[choosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        
        for index in 0..<self.cards.count {
            
            if self.cards[index].id == card.id {
                
                return index
            }
        }
        
        return 0 // TODO: Refactor
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
