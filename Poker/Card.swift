//
//  Card.swift
//  Poker
//
//  Created by 이영수 on 1/9/25.
//

import Foundation

struct Card {
    enum Suit: String, CaseIterable {
        case Spades = "Spades"
        case Hearts = "Hearts"
        case Diamonds = "Diamonds"
        case Clubs = "Clubs"
    }
    
    enum Rank: Int, CaseIterable {
        case ace = 1
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king
        
        var displayValue: String {
            switch self {
            case .ace: return "A"
            case .jack: return "J"
            case .queen: return "Q"
            case .king: return "K"
            default: return "\(rawValue)"
            }
        }
    }
    
    let suit: Suit
    let rank: Rank
}
