//
//  ChatManager.swift
//  TinderClone
//
//  Created by Gan Tu on 9/9/23.
//

import Foundation

class ChatManager: ObservableObject {
    @Published var messages: [Message] = []
    
    private var person: Person
    
    init(person: Person) {
        self.person = person
        loadMessages()
    }
    
    public func sendMessage(_ message: Message) {
        // Fake networking
        messages.append(message)
    }
    
    
    private func loadMessages() {
        // Fake networking right now
        messages = [Message.exampleSent, Message.exampleReceived]
    }
}
