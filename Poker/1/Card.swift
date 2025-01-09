//
//  Card.swift
//  Poker
//
//  Created by 이영수 on 1/9/25.
//

import Foundation

struct Card {
    enum Suit: String {
        case haerts, diamonds, clubs, spades
    }
    
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
    }
    
    let suit: Suit
    let rank: Rank
}
