//
//  MainView.swift
//  TinderClone
//
//  Created by Gan Tu on 9/4/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appState: AppStateManager
    
    func correctViewForState() -> some View {
        // AnyView is used to help returned view to be same type
        switch appState.selectedTab {
        case .fire:
            let view = Color.red
            return AnyView(view)
        case .star:
            let view = Color.yellow
            return AnyView(view)
        case .message:
            let view = Text("message")
            return AnyView(view)
        case .profile:
            let view = Text("profile")
            return AnyView(view)
        }
    }
    
    var body: some View {
        ZStack {
            // MARK: - Background
            Color(.systemGray6)
                .opacity(0.35)
                .ignoresSafeArea(.all)
            
            // MARK: - TabBar
            VStack {
                HStack {
                    Spacer()

                    TabBarButtonView(buttonType: .fire)
                    
                    Spacer()
                    
                    TabBarButtonView(buttonType: .star)

                    Spacer()
                    
                    TabBarButtonView(buttonType: .message)

                    Spacer()
                    
                    TabBarButtonView(buttonType: .profile)

                    Spacer()
                }
                .frame(height: 100)
                .padding(.top, 30)
                
                correctViewForState()
                
                Spacer()
            }
            .ignoresSafeArea(edges: .vertical)
        }
    }
}

#Preview {
    MainView()
        .environmentObject(AppStateManager())
}
