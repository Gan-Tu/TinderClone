//
//  ChatViewHeader.swift
//  TinderClone
//
//  Created by Gan Tu on 9/9/23.
//

import SwiftUI

struct ChatViewHeader: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    let imageURL: URL?
    let videoAction: () -> Void
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea().shadow(radius: 3)
            
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color.textPrimary)
                        .font(.system(size: 28, weight: .semibold))
                })
                
                Spacer()
                
                VStack(spacing: 0) {
                    RoundedImage(url: imageURL)
                        .frame(height: 50)
                    
                    Text(name)
                        .foregroundStyle(Color.textSecondary)
                        .font(.system(size: 14))
                }
                
                Spacer()
                
                Button(action: {
                    videoAction()
                }, label: {
                    Image(systemName: "video.fill")
                        .font(.system(size: 20, weight: .bold))
                })
            }
            .padding(.horizontal, 22)
            .padding(.vertical, 10)
        }
    }
}

#Preview {
    ChatViewHeader(name: Person.example.name, imageURL: Person.example.imageURLS.first, videoAction: {
        // TODO
    })
}
