//
//  MessagePreviewRowView.swift
//  TinderClone
//
//  Created by Gan Tu on 9/9/23.
//

import SwiftUI

struct MessagePreviewView: View {
    var preview: MessagePreview
    
    var body: some View {
        HStack {
            RoundedImage(url: preview.person.imageURLS.first)
                .frame(height: 90)
            
            VStack(alignment: .leading, spacing: 5, content: {
                Text(preview.person.name)
                    .font(.system(size: 21, weight: .semibold))
                
                Text(preview.lastMessage)
                    .foregroundStyle(Color.textPrimary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
            })
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    MessagePreviewView(preview: MessagePreview.exmaple)
}
