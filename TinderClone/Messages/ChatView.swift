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
    @State private var scrollProxy: ScrollViewProxy? = nil
    @State private var showTypingBubble: Bool = false
    private let kTypingBubbleId: Int = -1
    
    private var person: Person
    
    init(person: Person) {
        self.person = person
        self.chatManager = ChatManager(person: person)
    }
    
    func sendMessage() {
        let msg = typingMessage
        withAnimation(.easeOut) {
            typingMessage = ""
        }
        withAnimation(.easeIn.delay(0.4)) {
            chatManager.sendMessage(Message(content: msg, fromCurrentUser: true))
        }
    }
    
    func scrollToBottom() {
        withAnimation {
            scrollProxy?.scrollTo(showTypingBubble ? kTypingBubbleId : chatManager.messages.count - 1, anchor: .bottom)
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
                    ScrollViewReader { proxy in
                        LazyVStack {
                            ForEach(chatManager.messages.indices, id: \.self) { index in
                                MessageView(message: chatManager.messages[index])
                                    .id(index)
                            }
                            if showTypingBubble {
                                TypingBubbleView(fromCurrentUser: true)
                                    .id(kTypingBubbleId)
                            }
                        }
                        .onAppear(perform: {
                            scrollProxy = proxy
                        })
                    }
                }
                
                ZStack(alignment: .trailing) {
                    Color.textFieldBackground
                    
                    TextField("Type a message", text: $typingMessage)
                        .foregroundStyle(Color.textPrimary)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(height: 45)
                        .padding(.horizontal)
                        .onChange(of: typingMessage, perform: { value in
                            withAnimation(.easeInOut) {
                                showTypingBubble = !value.isEmpty
                                scrollToBottom()
                            }
                        })
                    
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
        .modifier(HideNavigationView())
        .onChange(of: chatManager.keyboardIsShowing, perform: { value in
            if value {
                scrollToBottom()
            }
        })
        .onChange(of: chatManager.messages, perform: { _ in
            scrollToBottom()
        })
    }
}

#Preview {
    ChatView(person: Person.example)
}
