//
//  ContentView.swift
//  Poker
//
//  Created by 이영수 on 1/9/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var navigateToPoker: Bool = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    // 배경 이미지가 들어갈 공간
//                    Image("")
//                        .resizable()
//                        .ignoresSafeArea()
                    VStack {
                        // 상단 헤더
                        HStack {
                            // 왼쪽: 로고, 제목
                            HStack {
                                Image(systemName: "suit.spade.fill")
                                Text("Poker Game")
                                    .font(.title2)
                            }
                            
                            Spacer()
                            
                            // 오른쪽: 프로필
                            HStack{
                                Text("Player")
                                Image(systemName: "person.circle.fill")
                                    .font(.largeTitle)
                            }
                        }
                        .padding()
                        
                        Spacer()
                        
                        // 메인 버튼들
                        VStack(spacing: geometry.size.height * 0.05) {
                            NavigationLink(value: "poker") {
                                MainButton(title: "Start Game", icon: "play.fill", width: geometry.size.width * 0.8)
                            }
                            MainButton(title: "Ranking", icon: "trophy.fill", width: geometry.size.width * 0.8)
                            MainButton(title: "Setting", icon: "gearshape.fill", width: geometry.size.width * 0.8)
                        }
                        
                        Spacer()
                    }
                    
                }
            }
            .navigationDestination(for: String.self) { route in
                if route == "poker" {
                    PokerView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
