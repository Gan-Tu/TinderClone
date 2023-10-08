//
//  LikesView.swift
//  TinderClone
//
//  Created by Gan Tu on 10/8/23.
//

import SwiftUI

struct LikesView: View {
    @EnvironmentObject var appState: AppStateManager
    @EnvironmentObject var userManager: UserManager
    
    private var user: User {
        return userManager.currentUser
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            
            if !user.goldSubscriber {
                Text("Upgrade to Tinder Gold to see people who already liked you.")
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundColor(.textTitle)
                    .padding(.horizontal, 15)
                    .font(.system(size: 16, weight: .medium))
            }
            
            LazyVGrid(
                columns: [GridItem(.flexible()), GridItem(.flexible())],
                alignment: .center,
                spacing: 20,
                content: {
                    ForEach(userManager.matches) { person in
                        PersonSquareView(person: person, blur: !user.goldSubscriber)
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
    LikesView()
        .environmentObject(UserManager())
        .environmentObject(AppStateManager())
}
