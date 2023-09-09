//
//  Message.swift
//  TinderClone
//
//  Created by Gan Tu on 9/8/23.
//

import Foundation

struct Message: Hashable {
    var content: String
    var fromCurrentUser: Bool = false
}

extension Message {
    static let exampleSent = Message(content: "Hello there", fromCurrentUser: true)
    static let exampleReceived = Message(content: "Hello there", fromCurrentUser: false)
}
