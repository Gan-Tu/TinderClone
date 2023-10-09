//
//  Subscription.swift
//  TinderClone
//
//  Created by Gan Tu on 10/8/23.
//

import Foundation

struct Subscription: Identifiable {
    let id = UUID().uuidString
    
    var month: Int
    var monthlyCost: Double
    var totalCost: Double
    var savedPercent: Int?
    var tagLine: TagLine = .none
    
    enum TagLine: String {
        case mostPopular = "Most Popular"
        case bestValue = "Best Value"
        case none
    }
}

extension Subscription {
    static let monthly = Subscription(month: 1, monthlyCost: 29.99, totalCost: 29.99)
    static let threeMonth = Subscription(month: 3, monthlyCost: 20.0, totalCost: 59.99, savedPercent: 3, tagLine: .mostPopular)
    static let sixMonth = Subscription(month: 6, monthlyCost: 15.00, totalCost: 89.99, savedPercent: 50, tagLine: .bestValue)
}
