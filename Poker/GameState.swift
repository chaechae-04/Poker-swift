//
//  GameState.swift
//  Poker
//
//  Created by 이영수 on 1/9/25.
//

import Foundation

struct GameState {
    var currentRound: BettingRound
    var lastAction: PlayerAction?
    var isGameOver: Bool
    var winners: [Player]
}
