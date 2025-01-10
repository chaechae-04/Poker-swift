//
//  MainButton.swift
//  Poker
//
//  Created by 이영수 on 1/10/25.
//

import SwiftUI

struct MainButton: View {
    let title: String
    let icon: String
    let width: CGFloat
    
    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(title)
        }
        .frame(width: width, height: 50)
        .background(.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}
