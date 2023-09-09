//
//  MessageListViewManager.swift
//  TinderClone
//
//  Created by Gan Tu on 9/9/23.
//

import Foundation

class MessageListViewManager: ObservableObject {
    @Published var messagePreviews: [MessagePreview] = []
    
    init() {
        loadPreviews()
    }
    
    private func loadPreviews() {
        // Fake networking to load message previews from a server
        self.messagePreviews = [MessagePreview.exmaple]
    }
}
