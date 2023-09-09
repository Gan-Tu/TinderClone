//
//  MessageThread.swift
//  TinderClone
//
//  Created by Gan Tu on 9/9/23.
//

import Foundation

struct MessagePreview: Hashable {
    var person: Person
    var lastMessage: String
}

extension MessagePreview {
    static let exmaple = MessagePreview(person: Person.example, lastMessage: "Hello there. How are you doing today? How's the weather over there.")
    
    static let examples: [MessagePreview] = [
        MessagePreview(person: Person.example, lastMessage: "Hello there. How are you doing today? How's the weather over there."),
        MessagePreview(person: Person.example2, lastMessage: "Wanna grab a coffee?"),
        MessagePreview(person: Person.example3, lastMessage: "I am free Thursday. Where do you want to meet up?"),
        MessagePreview(person: Person.example4, lastMessage: "I am travelling to Australia in May. How about you?"),
        MessagePreview(person: Person.example5, lastMessage: "Sup, cutie! Would love to meet up."),
        MessagePreview(person: Person.example6, lastMessage: "On my way."),
        MessagePreview(person: Person.example7, lastMessage: "I don't think we are a fit. Sorry"),
    ]
}
