//
//  MessageView.swift
//  TinderClone
//
//  Created by Gan Tu on 9/9/23.
//

import SwiftUI

struct MessageView: View {
    var message: Message
    
    var body: some View {
        HStack {
            if message.fromCurrentUser {
                Spacer()
            }
            
            Text(message.content)
                .padding(10)
                .foregroundStyle(Color.white)
                .background(message.fromCurrentUser ? Color.blue : Color.gray)
                .cornerRadius(10)
            
            if !message.fromCurrentUser {
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    VStack {
        MessageView(message: Message.exampleReceived)
        MessageView(message: Message.exampleSent)
    }
}
