//
//  Person.swift
//  TinderClone
//
//  Created by Gan Tu on 9/8/23.
//

import Foundation

struct Person: Hashable {
    var name: String
    var imageURLS: [URL]
}

extension Person {
    static let example = Person(name: "Alex", imageURLS: [URL(string: "https://i.pravatar.cc/400/300")!])
}
