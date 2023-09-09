//
//  ChatView.swift
//  TinderClone
//
//  Created by Gan Tu on 9/9/23.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatManager: ChatManager
    @State private var typingMessage: String = ""
    
    private var person: Person
    
    init(person: Person) {
        self.person = person
        self.chatManager = ChatManager(person: person)
    }
    
    func sendMessage() {
        withAnimation(.easeIn) {
            chatManager.sendMessage(Message(content: typingMessage))
            typingMessage = ""
        }
    }
    
    var body: some View {
        VStack  {
            ChatViewHeader(name: person.name, imageURL: person.imageURLS.first) {
                // TODO
            }
            .frame(maxHeight: 50)
            .padding(.vertical, 10)
            
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        ForEach(chatManager.messages.indices, id: \.self) { index in
                            MessageView(message: chatManager.messages[index])
                        }
                    }
                }
                
                ZStack(alignment: .trailing) {
                    Color.textFieldBackground
                    
                    TextField("Type a message", text: $typingMessage)
                        .foregroundStyle(Color.textPrimary)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(height: 45)
                        .padding(.horizontal)
                    
                    Button(action: {
                        sendMessage()
                    }, label: {
                        Text("Send")
                    })
                    .padding(.horizontal)
                    .foregroundStyle(typingMessage.isEmpty ? Color.textPrimary : Color.blue)
                }
                .frame(maxHeight: 40)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
        .navigationTitle("")
        .toolbar(.hidden)
    }
}

#Preview {
    ChatView(person: Person.example)
}
