//
//  MessageThread.swift
//  TinderClone
//
//  Created by Gan Tu on 9/9/23.
//

import Foundation

struct MessagePreview {
    var person: Person
    var lastMessage: String
}

extension MessagePreview {
    static let exmaple = MessagePreview(person: Person.example, lastMessage: "Hello there.")
}
