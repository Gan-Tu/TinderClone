//
//  FullScreenCardView.swift
//  TinderClone
//
//  Created by Gan Tu on 10/15/23.
//

import SwiftUI
import LoremSwiftum

struct FullScreenCardView: View {
    var person: Person
    @Binding var fullScreenMode: Bool
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(showsIndicators: false, content: {
                VStack(spacing: 0) {
                    CardImageScroller(person: person, fullScreenMode: $fullScreenMode)
                        .frame(width: screen.width, height: screen.height * 0.6)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(person.name)
                                    .font(.system(size: 32, weight: .heavy))
                                
                                Text("\(person.age)")
                                    .font(.system(size: 28, weight: .light))
                                
                                Spacer()
                            } // VStack
                            .opacity(0.75)
                            
                            // Text("\(Int.random(in: 0...20)) miles away")
                            Text("\(person.age % 10 + 2) miles away")
                                .font(.system(size: 18, weight: .medium))
                                .opacity(0.75)
                        } // VStack
                        .padding([.top, .horizontal], 16)
                        
                        Button(action: {
                            // TODO
                        }, label: {
                            Image(systemName: "arrow.down.circle.fill")
                                .font(.system(size: 42))
                                .background(Color.white)
                                .clipShape(Circle())
                        })
                        .padding(.trailing, 16)
                        .offset(y: -40)
                        
                    } // HStack
                    
                    Spacer().frame(height: 26)
                    
                    HStack {
                        Text("\(person.bio). \(Lorem.sentences(2))")
                            .font(.system(size:  18, weight: .medium))
                            .lineLimit(20)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .opacity(0.75)
                            .padding(.horizontal, 16)
                        
                        Spacer()
                    } // HStack
                    
                    Spacer().frame(height: 32)
                    
                    VStack(spacing: 24) {
                        Button(action: {
                            // TODO
                        }, label: {
                            VStack {
                                Text("SHARE \(person.name.uppercased())'S PROFILE")
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("SEE WHAT A FRIEND THINKS")
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .opacity(0.9)
                        })
                        
                        Button(action: {
                            // TODO
                        }, label: {
                            Text("REPORT \(person.name.uppercased())")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundStyle(Color.black)
                                .opacity(0.75)
                        })

                    } // VStack
                    
                    Spacer().frame(height: 100)
                    
                } // VStack
            })
        } //ScrollView
        
        Text("Overlay")
    } // ZSTACK
}

#Preview {
    FullScreenCardView(person: Person.example, fullScreenMode: .constant(true))
}
