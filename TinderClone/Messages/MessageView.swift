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
                .foregroundStyle(
                    message.fromCurrentUser ? Color.white : Color.black)
                .background(
                    message.fromCurrentUser ? Color.blue : Color.gray.opacity(0.2))
                .multilineTextAlignment(.leading)
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
        MessageView(message: Message.exampleReceivedLong)
        MessageView(message: Message.exampleSentLong)
    }
}
