//
//  HandEvaluator.swift
//  Poker
//
//  Created by 이영수 on 1/9/25.
//

import Foundation

struct HandEvaluator {
    func evaluateHand(holeCards: [Card], communityCards: [Card]) -> HandRanking {
        let allCards = holeCards + communityCards
        
        if isRoyalStraightFlush(cards: allCards) { return .royalStraightFlush }
        if isRoyalFlush(cards: allCards) { return .royalFlush }
        if isStraightFlush(cards: allCards) { return .straightFlush }
        if isFourOfKind(cards: allCards) { return .fourOfKind }
        if isFullHouse(cards: allCards) { return .fullHouse }
        if isFlush(cards: allCards) { return .flush }
        if isStraight(cards: allCards) { return .straight }
        if isThreeOfKind(cards: allCards) { return .threeOfKind }
        if isTwoPair(cards: allCards) { return .twoPair }
        if isPair(cards: allCards) { return .pair }
        
        return .highCard
    }
    
    private func cardGrouping(cards: [Card], containsValue: Int) -> Bool {
        let rankCounts = Dictionary(grouping: cards) { $0.rank }.map { $0.value.count }
        return rankCounts.contains(containsValue)
    }
    
    private func isPair(cards: [Card]) -> Bool {
        return cardGrouping(cards: cards, containsValue: 2)
    }
    
    private func isTwoPair(cards: [Card]) -> Bool {
        return Dictionary(grouping: cards) { $0.rank }.map { $0.value.count }.filter { $0 == 2 }.count >= 2
    }
    
    private func isThreeOfKind(cards: [Card]) -> Bool {
        return cardGrouping(cards: cards, containsValue: 3)
    }
    
    private func isStraight(cards: [Card]) -> Bool {
        let ranks = cards.map { $0.rank.rawValue }.sorted()
        
        for i in 1..<ranks.count {
            if ranks[i] != ranks[i - 1] + 1 {
                return false
            }
        }
        
        return true
    }
    
    private func isFlush(cards: [Card]) -> Bool {
        return Set(cards.map { $0.suit }).count == 1
    }
    
    /* FullHouse = ThreeOfKind + Pair*/
    private func isFullHouse(cards: [Card]) -> Bool {
        return cardGrouping(cards: cards, containsValue: 3) && cardGrouping(cards: cards, containsValue: 2)
    }
    
    private func isFourOfKind(cards: [Card]) -> Bool {
        return cardGrouping(cards: cards, containsValue: 4)
    }
    
    private func isStraightFlush(cards: [Card]) -> Bool {
        return isStraight(cards: cards) && isFlush(cards: cards)
    }
    
    private func isRoyalFlush(cards: [Card]) -> Bool {
        return isFlush(cards: cards) && (cards.map { $0.rank.rawValue }.sorted()) == [10, 11, 12, 13, 14]
    }
    
    private func isRoyalStraightFlush(cards: [Card]) -> Bool {
        return isStraightFlush(cards: cards) && (cards.map { $0.rank.rawValue }.sorted()) == [10, 11, 12, 13, 14]
    }
}
