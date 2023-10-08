//
//  MatchesView.swift
//  TinderClone
//
//  Created by Gan Tu on 10/8/23.
//

import SwiftUI

struct MatchesView: View {
    @EnvironmentObject var appState: AppStateManager
    @EnvironmentObject var userManager: UserManager
    
    @State private var selectedTab: LikedTab = .likes
    
    enum LikedTab {
        case likes
        case topPicks
    }
    
    private var buttonText: String {
        if selectedTab == .likes {
            return "See who likes you".uppercased()
        } else {
            return "Unlock top picks".uppercased()
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        selectedTab = .likes
                    }, label: {
                        Text("\(userManager.matches.count) likes")
                            .font(.system(size: 22, weight: .semibold))
                            .if(selectedTab == .topPicks) {
                                $0.foregroundColor(.textPrimary)
                            }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                    
                    Button(action: {
                        selectedTab = .topPicks
                    }, label: {
                        Text("\(userManager.topPicks.count) Top Picks")
                            .font(.system(size: 22, weight: .semibold))
                            .if(selectedTab == .likes) {
                                $0.foregroundColor(.textPrimary)
                            }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }
                
                
                Divider()
                    .padding(.vertical, 14)
                
                if selectedTab == .likes {
                    LikesView()
                } else {
                    TopPicksView()
                }
                
                
                Spacer()
            }
            
            Button(action: {
                appState.showPurchaseScreen()
            }, label: {
                Text(buttonText)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 36)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                    .background(Color.yellow)
                    .cornerRadius(30)
            })
            .buttonStyle(PlainButtonStyle())
            .padding(.bottom, 40)
        }
    }
}

#Preview {
    MatchesView()
        .environmentObject(UserManager())
        .environmentObject(AppStateManager())
}
