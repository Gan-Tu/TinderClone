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
    static let example = Person(name: "Alex", imageURLS: [URL(string: "https://i.pravatar.cc/400?img=52")!])
    static let example2 = Person(name: "Jessica", imageURLS: [URL(string: "https://i.pravatar.cc/400?img=49")!])
    static let example3 = Person(name: "Steven", imageURLS: [URL(string: "https://i.pravatar.cc/400?img=53")!])
    static let example4 = Person(name: "Cove", imageURLS: [URL(string: "https://i.pravatar.cc/400?img=36")!])
    static let example5 = Person(name: "Parker", imageURLS: [URL(string: "https://i.pravatar.cc/400?img=12")!])
    static let example6 = Person(name: "Melisa", imageURLS: [URL(string: "https://i.pravatar.cc/400?img=43")!])
    static let example7 = Person(name: "Brent", imageURLS: [URL(string: "https://i.pravatar.cc/400?img=14")!])
}
