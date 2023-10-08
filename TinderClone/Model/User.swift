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
    var imageURLS: [URL]
    var bio: String
    var age: Int
}

extension User {
    static let example = User(name: "Gan",
                              goldSubscriber: false,
                              imageURLS: [URL(string: "https://i.pravatar.cc/400?img=58")!],
                              bio: "Software Engineer",
                              age: 26)
    static let goldSubscriberExample = User(name: "Gan",
                                            goldSubscriber: true,
                                            imageURLS: [URL(string: "https://i.pravatar.cc/400?img=58")!],
                                            bio: "Software Engineer",
                                            age: 26)
}
