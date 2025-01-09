//
//  Action.swift
//  Poker
//
//  Created by 이영수 on 1/9/25.
//

import Foundation

enum PlayerAction {
    case flod
    case check
    case call(amount: Int)
    case raise(amount: Int)
    case allIn
}
