//
//  TabBarButtonView.swift
//  TinderClone
//
//  Created by Gan Tu on 9/4/23.
//

import SwiftUI

enum TabBarButtonType: String {
    case fire = "flame.fill"
    case star = "star.fill"
    case message = "message.fill"
    case profile = "person.fill"
}

struct TabBarButtonView: View {
    let buttonType: TabBarButtonType
    @EnvironmentObject var appState: AppStateManager
    
    var body: some View {
        Button(action: {
            appState.selectedTab = buttonType
        }, label: {
            Image(systemName: buttonType.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .if(appState.selectedTab == buttonType, transform: {
                    $0.foregroundColor(buttonType == .star ? .yellow : .red)
                })
                    .foregroundColor(Color.gray.opacity(0.5))
        })
        .frame(height: 32)
    }
}

#Preview {
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
    .environmentObject(AppStateManager())
}
