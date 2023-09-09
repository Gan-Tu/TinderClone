//
//  ChatManager.swift
//  TinderClone
//
//  Created by Gan Tu on 9/9/23.
//

import Foundation
import Combine
import UIKit

class ChatManager: ObservableObject {
    @Published var messages: [Message] = []
    @Published var keyboardIsShowing: Bool = false
    var cancellable: AnyCancellable? = nil
    
    private var person: Person
    
    init(person: Person) {
        self.person = person
        loadMessages()
        setupPublishers()
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    public func sendMessage(_ message: Message) {
        // Fake networking
        messages.append(message)
    }
    
    private let keyboardWillShow = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map({_ in true})
    
    private let keyboardWillHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map({_ in false})
    
    private func setupPublishers() {
        cancellable = Publishers.Merge(keyboardWillShow, keyboardWillHide)
            .subscribe(on: DispatchQueue.main)
            .assign(to: \.keyboardIsShowing, on: self)
    }
    
    private func loadMessages() {
        // Fake networking right now
        if person.conversations.isEmpty {
            messages = [Message.exampleSent, Message.exampleReceived]
        } else {
            messages = person.conversations
        }
    }
}
