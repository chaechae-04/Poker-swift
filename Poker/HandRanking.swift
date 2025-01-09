//
//  HandRanking.swift
//  Poker
//
//  Created by 이영수 on 1/9/25.
//

import Foundation

enum HandRanking: Int {
    case highCard = 1
    case pair
    case twoPair
    case threeOfKind
    case straight
    case flush
    case fullHouse
    case fourOfKind
    case straightFlush
    case royalFlush
    case royalStraightFlush
}
