//
//  HomeView.swift
//  TinderClone
//
//  Created by Gan Tu on 10/15/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var appState: AppStateManager

    var body: some View {
        VStack {
            Spacer()
            
            CardStack(people: userManager.swipeQueue)
            
            Spacer()
            
            HStack {
                CircleButtonView(type: .back) {
                    if !userManager.currentUser.goldSubscriber {
                        appState.showPurchaseScreen()
                    } else {
                        // NOT IMPLEMENTED
                    }
                }
                
                Spacer()
                
                CircleButtonView(type: .no) {
                    if let person = userManager.swipeQueue.last {
                        userManager.swipe(person, .nope)
                    }
                }
                
                Spacer()
                
                CircleButtonView(type: .star) {
                    if let person = userManager.swipeQueue.last {
                        if userManager.currentUser.goldSubscriber {
                            userManager.superLike(person)
                        } else {
                            appState.showPurchaseScreen()
                        }
                    }
                }
                
                Spacer()
                
                CircleButtonView(type: .heart) {
                    if let person = userManager.swipeQueue.last {
                        userManager.swipe(person, .like)
                    }
                }
                
                Spacer()
                
                CircleButtonView(type: .lightning) {
                    if !userManager.currentUser.goldSubscriber {
                        appState.showPurchaseScreen()
                    } else {
                        // NOT IMPLEMENTED
                    }
                }
                
                Spacer()
            }
            .frame(height: 50)
            .padding(.horizontal)
            .padding(.vertical, 25)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(UserManager())
        .environmentObject(AppStateManager())
}
