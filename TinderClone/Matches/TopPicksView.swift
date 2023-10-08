//
//  TopPicksView.swift
//  TinderClone
//
//  Created by Gan Tu on 10/8/23.
//

import SwiftUI

struct TopPicksView: View {
    @EnvironmentObject var appState: AppStateManager
    @EnvironmentObject var userManager: UserManager
    
    private var user: User {
        return userManager.currentUser
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            
            if !user.goldSubscriber {
                Text("Upgrade to Tinder Gold for more Top Picks!")
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundColor(.textTitle)
                    .font(.system(size: 16, weight: .medium))
            }
            
            LazyVGrid(
                columns: [GridItem(.flexible()), GridItem(.flexible())],
                alignment: .center,
                spacing: 20,
                content: {
                    ForEach(userManager.topPicks) { person in
                        PersonSquareView(person: person, blur: false)
                            .frame(height: 240)
                            .onTapGesture(perform: {
                                personTapped(person)
                            })
                    }
                })
            .padding(.horizontal, 10)
            
        })
    }
    
    func personTapped(_ person: Person) {
        if user.goldSubscriber {
            appState.showPersonsProfile(person)
        } else {
            appState.showPurchaseScreen()
        }
    }
}

#Preview {
    TopPicksView()
        .environmentObject(UserManager())
        .environmentObject(AppStateManager())
}
