//
//  PokerView.swift
//  Poker
//
//  Created by 이영수 on 1/10/25.
//

import SwiftUI

struct PokerView: View {
    @State private var playerCards: [Card] = []
    @State private var communityCards: [Card] = []
    @State private var chips: Int = 1000
    @State private var deck = Deck()
    @State private var gamePhase: BettingRound = .preFlop
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // 상단: Chips
                Text("Chips: \(chips)")
                    .font(.headline)
                    
                // 중앙: Community Cards
                Text("Community Cards")
                CardView(cards: communityCards)
                
                Spacer()
                
                // 하단: Player Cards + Button
                CardView(cards: playerCards)
                Text("Your Hand")
                
                HStack {
                    Button("Check") { /* Check Action */ }
                    Button("Bet") { /* Bet Action */ }
                    Button("Fold") { /* Fold Action */ }
                    Button(action: dealNextPhase) {
                        Text("Next")
                    }
                }
                .padding()
            }
            .padding()
        }
    }
}

struct CardView: View {
    let cards: [Card]
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(cards, id: \.rank) { card in
                let suffix = card.suit == .Diamonds ? "D" :
                                card.suit == .Hearts ? "H" :
                                card.suit == .Spades ? "S" : "C"

                Image("Cards/\(card.suit.rawValue)/\(card.rank.displayValue)\(suffix)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70)
                
            }
        }
    }
}

extension PokerView {
    func dealNextPhase() {
        switch gamePhase {
        case .preFlop:
            deck = Deck()
            deck.shuffle()
            playerCards = [deck.drawCard(), deck.drawCard()]
            communityCards = []
            gamePhase = .flop
        case .flop:
            communityCards = [deck.drawCard(), deck.drawCard(), deck.drawCard()]
            gamePhase = .turn
        case .turn:
            communityCards.append(deck.drawCard())
            gamePhase = .river
        case .river:
            communityCards.append(deck.drawCard())
            gamePhase = .preFlop
        }
        
    }
}

#Preview {
    PokerView()
}
