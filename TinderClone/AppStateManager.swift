//
//  AppStateManager.swift
//  TinderClone
//
//  Created by Gan Tu on 9/4/23.
//

import Foundation

class AppStateManager: ObservableObject {
    @Published var selectedTab: TabBarButtonType = .fire
    
    @Published var showPersonsProfile: Person? = nil
    
    @Published var showPurchasePopup: Bool = false
    
    public func showPersonsProfile(_ person: Person) {
        self.showPersonsProfile = person
        // You can do networking and analytics here
    }
    
    public func showPurchaseScreen() {
        self.showPurchasePopup = true
    }
}
