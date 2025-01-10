//
//  Deck.swift
//  Poker
//
//  Created by 이영수 on 1/10/25.
//


struct Deck {
    private var cards: [Card] = []
    
    init() {
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                cards.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    mutating func drawCard() -> Card {
        return cards.removeLast()
    }
}
