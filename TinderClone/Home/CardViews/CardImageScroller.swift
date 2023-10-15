//
//  CardImageScroller.swift
//  TinderClone
//
//  Created by Gan Tu on 10/15/23.
//

import SwiftUI
import KingfisherSwiftUI

struct CardImageScroller: View {
    var person: Person
    @Binding var fullScreenMode: Bool
    
    @State private var imageIndex = 0
    
    func swipeRight() {
        imageIndex = min(imageIndex + 1, person.imageURLS.count-1)
    }
    
    func swipeLeft() {
        imageIndex = max(imageIndex - 1, 0)
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ZStack {
                    KFImage(person.imageURLS[imageIndex])
                        .placeholder {
                            Color.white
                        }
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                        .onTapGesture(perform: {
                            swipeLeft();
                        })
                    
                    HStack {
                        Rectangle()
                            .onTapGesture {
                                swipeLeft()
                            }
                        
                        Rectangle()
                            .onTapGesture {
                                swipeRight()
                            }
                    }
                    .foregroundColor(Color.white.opacity(0.01))
                } // ZSTACK
                
                VStack {
                    HStack {
                        ForEach(0..<person.imageURLS.count, id:\.self) { imageIndex in
                            RoundedRectangle(cornerRadius: 20)
                                .frame(height: 4)
                                .foregroundColor(self.imageIndex == imageIndex ? Color.white : Color.gray.opacity(0.5))
                        }
                    }
                    .padding(.top, 10)
                    .padding(.horizontal, fullScreenMode ? 0 : 12)
                    
                    Spacer()
                    
                    if !fullScreenMode {
                        HStack {
                            VStack(alignment:. leading) {
                                HStack {
                                    Text(person.name)
                                        .font(.system(size: 32, weight: .heavy))
                                    
                                    Text("\(person.age)")
                                        .font(.system(size: 28, weight: .light))
                                }
                                
                                Text(person.bio)
                                    .font(.system(size: 18, weight: .medium))
                                    .lineLimit(2)
                            } // VSTACK
                            
                            Spacer()
                            
                            Button(action: {
                                fullScreenMode = true
                            }, label: {
                                Image(systemName: "info.circle.fill")
                                    .font(.system(size: 26, weight: .medium))
                            })
                        } // HSTACK
                        .padding(16)
                    }
                }
                .foregroundColor(Color.white)
                
            } // ZSTACK
            .cornerRadius(6)
            .shadow(radius: 5)
        }
    }
}

#Preview("Normal View") {
    CardImageScroller(person: Person.example, fullScreenMode: .constant(false))
}

#Preview("Full Screen") {
    CardImageScroller(person: Person.example, fullScreenMode: .constant(true))
}
