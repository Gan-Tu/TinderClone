//
//  User.swift
//  TinderClone
//
//  Created by Gan Tu on 10/8/23.
//

import Foundation

struct User {
    var name: String

    var goldSubscriber: Bool = false
}

extension User {
    static let example = User(name: "Alex", goldSubscriber: false)
    static let goldSubscriberExample = User(name: "Alex", goldSubscriber: true)
}
