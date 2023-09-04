//
//  ContentView.swift
//  TinderClone
//
//  Created by Gan Tu on 9/4/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var appState: AppStateManager = AppStateManager()
    
    var body: some View {
        MainView()
            .environmentObject(appState)
    }
}

#Preview {
    ContentView()
}
