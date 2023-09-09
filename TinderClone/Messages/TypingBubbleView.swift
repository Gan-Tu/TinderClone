//
//  TypingBubbleView.swift
//  TinderClone
//
//  Created by Gan Tu on 9/9/23.
//

import SwiftUI

struct TypingBubbleView: View {
    var fromCurrentUser: Bool
    @State private var isAnimating: Bool = false
    @State private var bubbleOpacities = [0.5, 0.7, 0.9]
    
    var body: some View {
        HStack {
            if fromCurrentUser {
                Spacer()
            }
            
            HStack {
                Circle().frame(width: 10, height: 10)
                    .foregroundStyle(Color.gray.opacity(isAnimating ? 0.5 : 0.9))
                Circle().frame(width: 10, height: 10)
                    .foregroundStyle(Color.gray.opacity(0.7))
                Circle().frame(width: 10, height: 10)
                    .foregroundStyle(Color.gray.opacity(isAnimating ? 0.9 : 0.5))
            }
            .padding(.horizontal, 12)
            .padding(.vertical)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(10)
            
            if !fromCurrentUser {
                Spacer()
            }
        }
        .padding()
        .onAppear(perform: {
            withAnimation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                isAnimating = true
            }
        })
    }
}

#Preview {
    VStack {
        TypingBubbleView(fromCurrentUser: true)
    }
}
