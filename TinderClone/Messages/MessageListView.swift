//
//  MessageListView.swift
//  TinderClone
//
//  Created by Gan Tu on 9/9/23.
//

import SwiftUI

struct MessageListView: View {
    @ObservedObject var vm: MessageListViewManager = MessageListViewManager()
    @State private var searchText: String = ""
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search Matches", text: $searchText)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color.textFieldBackground)
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(Color.textPrimary)
                                .font(.system(size: 20, weight: .bold))
                                .padding(.leading, 4)
                            
                            Spacer()
                        }
                    )
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.25)) {
                            self.isEditing = true
                        }
                    }
                
                if isEditing {
                    Button(action: {
                        withAnimation(.easeIn(duration: 0.25)) {
                            hideKeyboard()
                            self.isEditing = false
                            self.searchText = ""
                        }
                    }, label: {
                        Text("Cancel")
                    })
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                }
            }
            
            Text("Conersations")
            
            Spacer()
        }
    }
}

#Preview {
    MessageListView()
}
