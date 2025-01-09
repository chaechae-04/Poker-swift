//
//  Player.swift
//  Poker
//
//  Created by 이영수 on 1/9/25.
//

import Foundation

struct Player {
    let id: UUID
    var name: String
    var chips: Int
    var holeCards: [Card]
    var isDealer: Bool
}
