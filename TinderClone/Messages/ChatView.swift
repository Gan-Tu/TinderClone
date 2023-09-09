//
//  ChatView.swift
//  TinderClone
//
//  Created by Gan Tu on 9/9/23.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatManager: ChatManager
    
    private var person: Person
    
    init(person: Person) {
        self.person = person
        self.chatManager = ChatManager(person: person)
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(chatManager.messages.indices, id: \.self) { index in
                    MessageView(message: chatManager.messages[index])
                }
            }
        }
    }
}

#Preview {
    ChatView(person: Person.example)
}
