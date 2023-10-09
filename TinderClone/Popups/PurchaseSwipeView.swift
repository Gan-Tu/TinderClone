//
//  PurchaseSwipeView.swift
//  TinderClone
//
//  Created by Gan Tu on 10/8/23.
//

import SwiftUI

struct PurchaseSwipeView: View {
    var body: some View {
        TabView {
            VStack(spacing: 10) {
                Image(systemName: "thermometer.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                
                Text("25 people already liked you!")
                    .font(.system(size: 18, weight: .semibold))
                
                Text("Match with them instantly")
            }
            
            VStack(spacing: 10) {
                Image(systemName: "heart.circle.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                
                Text("Top Picks")
                    .font(.system(size: 18, weight: .semibold))
                
                Text("Browse through a daily curated\nselection of profiles")
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
            
            VStack(spacing: 10) {
                Image(systemName: "paperplane.circle.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                
                Text("Passport")
                    .font(.system(size: 18, weight: .semibold))
                
                Text("Match and chat with people\nanywhere in the world")
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
            
            VStack(spacing: 10) {
                Image(systemName: "calendar.badge.plus")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                
                Text("1 Fee Boost per month")
                    .font(.system(size: 18, weight: .semibold))
                
                Text("Free monthly Boost\nso you get more likes")
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#Preview {
    PurchaseSwipeView()
        .frame(height: UIScreen.main.bounds.height / 3)
}
