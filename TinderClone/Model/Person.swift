//
//  Person.swift
//  TinderClone
//
//  Created by Gan Tu on 9/8/23.
//

import Foundation

struct Person: Hashable {
    var name: String
    var bio: String
    var imageURLS: [URL]
    var conversations: [Message] = []
}

extension Person {
    static let example = Person(name: "Alex", bio: "I am photographer and love dogs", imageURLS: [URL(string: "https://i.pravatar.cc/400?img=52")!],
                                conversations: [
                                    Message.exampleReceived,
                                    Message.exampleSent,
                                    Message(content: "Hello there. How are you doing today? How's the weather over there.", fromCurrentUser: false)]
    )
    static let example2 = Person(name: "Jessica", bio: "I like to go to the beach", imageURLS: [URL(string: "https://i.pravatar.cc/400?img=49")!],
                                 conversations: [
                                    Message.exampleReceived,
                                    Message.exampleSent,
                                    Message(content: "Wanna grab a coffee?", fromCurrentUser: false)]
    )
    static let example3 = Person(name: "Steven", bio: "Nerdy boy who looks for love", imageURLS: [URL(string: "https://i.pravatar.cc/400?img=53")!],
                                 conversations: [
                                    Message.exampleReceived,
                                    Message.exampleSent,
                                    Message(content: "I am free Thursday. Where do you want to meet up?", fromCurrentUser: false)]
    )
    static let example4 = Person(name: "Cove", bio: "Fashion Designer", imageURLS: [URL(string: "https://i.pravatar.cc/400?img=36")!],
                                 conversations: [
                                    Message.exampleReceived,
                                    Message.exampleSent,
                                    Message(content: "I am travelling to Australia in May. How about you?", fromCurrentUser: false)]
    )
    static let example5 = Person(name: "Parker", bio: "I love playing basketball and soccer.", imageURLS: [URL(string: "https://i.pravatar.cc/400?img=12")!],
                                 conversations: [
                                    Message.exampleReceived,
                                    Message.exampleSent,
                                    Message(content: "Sup, cutie! Would love to meet up.", fromCurrentUser: false)]
    )
    static let example6 = Person(name: "Melisa", bio: "Savage Girl on the app", imageURLS: [URL(string: "https://i.pravatar.cc/400?img=43")!],
                                 conversations: [
                                    Message.exampleReceived,
                                    Message.exampleSent,
                                    Message(content: "On my way.", fromCurrentUser: false)]
    )
    static let example7 = Person(name: "Brent", bio: "Gym rat", imageURLS: [URL(string: "https://i.pravatar.cc/400?img=14")!],
                                 conversations: [
                                    Message.exampleReceived,
                                    Message.exampleSent,
                                    Message(content: "I don't think we are a fit. Sorry", fromCurrentUser: false)]
    )
}
