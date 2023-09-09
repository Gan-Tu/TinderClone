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
    static let exampleSentLong = Message(content: "Hello there. How are you doing today? How's the weather over there. It is raining over here.", fromCurrentUser: true)
    static let exampleReceivedLong = Message(content: "Hello there. I am doing great. It is snowing over here in Canada.", fromCurrentUser: false)
}
