//
//  AppStateManager.swift
//  TinderClone
//
//  Created by Gan Tu on 9/4/23.
//

import Foundation

class AppStateManager: ObservableObject {
    @Published var selectedTab: TabBarButtonType = .fire
}
