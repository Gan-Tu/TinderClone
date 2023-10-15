//
//  MainView.swift
//  TinderClone
//
//  Created by Gan Tu on 9/4/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appState: AppStateManager
    @EnvironmentObject var userManager: UserManager
    
    func correctViewForState() -> some View {
        // AnyView is used to help returned view to be same type
        switch appState.selectedTab {
        case .fire:
            let view = HomeView()
            return AnyView(view)
        case .star:
            let view = MatchesView()
            return AnyView(view)
        case .message:
            let view = MessageListView()
            return AnyView(view)
        case .profile:
            let view = ProfileView()
            return AnyView(view)
        }
    }
    
    var body: some View {
        NavigationView {
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
                    .frame(minHeight: 50)
                    
                    correctViewForState().ignoresSafeArea(edges: .vertical)
                    
                    Spacer()
                }
                .ignoresSafeArea(edges: .bottom)
                
                if appState.showPurchasePopup {
                    PurchasePopup(isVisible: $appState.showPurchasePopup)
                        .animation(.interactiveSpring(response: 0.3, dampingFraction: 0.75, blendDuration: 0.5))
                        .transition(.offset(y: 1000))
                        .zIndex(1)
                }
            }
        }
        .modifier(HideNavigationView())
    }
}

#Preview {
    MainView()
        .environmentObject(AppStateManager())
        .environmentObject(UserManager())
}
