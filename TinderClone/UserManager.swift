//
//  UserManager.swift
//  TinderClone
//
//  Created by Gan Tu on 10/8/23.
//

import Foundation

class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "", imageURLS: [], bio: "", age: 0)
    @Published var matches: [Person] = []
    @Published var topPicks: [Person] = []
    
    @Published var swipeQueue: [Person] = []
    
    var user: User {
        return currentUser
    }
    
    init() {
        loadUser()
        loadMatches()
        loadTopPicks()
        loadSwipeQueue()
    }
    
    private func loadUser() {
        // Mock networking here
        // self.currentUser = .goldSubscriberExample
        self.currentUser = .example
    }
    
    private func loadMatches() {
        // Mock networking here
        self.matches = Person.randomExamples(5)
    }
    
    private func loadTopPicks() {
        // Mock networking here
        self.topPicks = Person.randomExamples(4)
    }
    
    private func loadSwipeQueue() {
        // Mock networking here
        self.swipeQueue = Person.randomExamples(5)
    }
    
    public func swipe(_ person: Person, _ direction: SwipeDirection) {
        self.swipeQueue.removeLast()
        // You can handle what to do for matching conditions
    }
    
    public func superLike(_ person: Person) {
        self.swipeQueue.removeLast()
        // You can handle what to do for super like
    }
}

enum SwipeDirection {
    case like
    case nope
}
