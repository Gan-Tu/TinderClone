//
//  MessageThread.swift
//  TinderClone
//
//  Created by Gan Tu on 9/9/23.
//

import Foundation

struct MessagePreview: Hashable {
    var person: Person
    var lastMessage: String {
        if person.conversations.last != nil {
            return person.conversations.last!.content
        }
        return "No messages"
    }
}

extension MessagePreview {    
    static let exmaple = MessagePreview(person: Person.example)
    
    static let examples: [MessagePreview] = [
        MessagePreview(person: Person.example),
        MessagePreview(person: Person.example2),
        MessagePreview(person: Person.example3),
        MessagePreview(person: Person.example4),
        MessagePreview(person: Person.example5),
        MessagePreview(person: Person.example6),
        MessagePreview(person: Person.example7)
    ]
}
