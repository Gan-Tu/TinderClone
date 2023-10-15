//
//  FullScreenCardView.swift
//  TinderClone
//
//  Created by Gan Tu on 10/15/23.
//

import SwiftUI

struct FullScreenCardView: View {
    @EnvironmentObject var userManager: UserManager
    
    var person: Person
    
    @Binding var fullScreenMode: Bool
    
    let screen = UIScreen.main.bounds
    
    func showActionSheet() {
        let items: [Any] = ["What do you think about \(person.name)? \n"]
        let av = UIActivityViewController(activityItems: items, applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
    
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
                            fullScreenMode = false
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
                        Text("\(person.bio)")
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
                            showActionSheet()
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
            
            
            HStack(spacing: 20) {
                Spacer()

                CircleButtonView(type: .no, action: {
                    fullScreenMode = false
                    userManager.swipe(person, .nope)
                })
                .frame(height: 50)
                
                CircleButtonView(type: .star, action: {
                    fullScreenMode = false
                    userManager.superLike(person)
                })
                .frame(height: 50)
                
                CircleButtonView(type: .heart, action: {
                    fullScreenMode = false
                    userManager.swipe(person, .like)
                })
                .frame(height: 50)
                
                Spacer()
            } // HSTACK
            .padding(.top, 25)
            .padding(.bottom, 45)
            .edgesIgnoringSafeArea(.all)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.2), Color.white]), startPoint: .top, endPoint: .bottom)
            )
        } //ScrollView
        .edgesIgnoringSafeArea(.bottom)
        .padding(.top, 20)
        
    } // ZSTACK
}

#Preview {
    FullScreenCardView(person: Person.example, fullScreenMode: .constant(true))
        .environmentObject(UserManager())
}
