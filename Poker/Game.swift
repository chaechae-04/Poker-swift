//
//  Game.swift
//  Poker
//
//  Created by 이영수 on 1/9/25.
//

import Foundation

struct Game {
    var Players: [Player]
    var deck: [Card]
    var communityCard: [Card]
    var pot: Int
    var currentBet: Int
    var activePlayer: UUID
}
