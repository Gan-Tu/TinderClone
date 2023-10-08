//
//  ContentView.swift
//  TinderClone
//
//  Created by Gan Tu on 9/4/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var appState: AppStateManager = AppStateManager()
    @ObservedObject var userManager: UserManager = UserManager()
    
    var body: some View {
        MainView()
            .environmentObject(appState)
            .environmentObject(userManager)
    }
}

#Preview {
    ContentView()
}
