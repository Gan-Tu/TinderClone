//
//  CardView.swift
//  TinderClone
//
//  Created by Gan Tu on 10/15/23.
//

import SwiftUI

struct CardView: View {
    var person: Person
    
    // Used for card mamipulation
    @State var x: CGFloat = 0.0
    @State var y: CGFloat = 0.0
    @State var degree: Double = 0.0
    
    @Binding var fullScreenMode: Bool
    
    let screenCutoff = (UIScreen.main.bounds.width / 2) * 0.8
    let popupCutoff = (UIScreen.main.bounds.width / 2) * 0.2
    
    var body: some View {
        GeometryReader { geo in
            if fullScreenMode {
                FullScreenCardView(person: person, fullScreenMode: $fullScreenMode)
            } else {
                ZStack {
                    CardImageScroller(person: person, fullScreenMode: $fullScreenMode)
                    
                    VStack {
                        HStack {
                            Image("nopeButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                                .opacity(Double(x / popupCutoff) - 1)
                            
                            Spacer()
                            
                            Image("likeButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                                .opacity(Double(-x / popupCutoff) - 1)
                        }
                        .padding(.horizontal, 20)
                        
                        Spacer()
                    } // VSTACK
                }
                .animation(.easeOut(duration: 0.2))
                .frame(width: geo.size.width - 20, height: geo.size.height)
                .padding(.leading, 10)
                .offset(x: x, y: y)
                .rotationEffect(.degrees(degree))
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.easeOut(duration: 0.2)) {
                                x = value.translation.width
                                y = value.translation.height
                                withAnimation(.easeOut(duration: 0.2)) {
                                    degree = Double((value.translation.width/25))
                                }
                            }
                        })
                        .onEnded({ value in
                            withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 10, initialVelocity: 0)) {
                                let width = value.translation.width
                                if abs(width) <= screenCutoff {
                                    // snap back
                                    x = 0
                                    y = 0
                                    degree = 0
                                }else if width > screenCutoff {
                                    // swipe right
                                    x = 500
                                    degree = 12
                                } else if width < -screenCutoff {
                                    // swipe left
                                    x = -500
                                    degree = -12
                                }
                            }
                        })
                )
            }
        }
    }
}


struct InteractiveCardTestView: View {
    @State var fullScreenMode = false
    
    var body: some View {
        CardView(person: Person.example, fullScreenMode: $fullScreenMode)
    }
}

#Preview("Interactive View") {
    InteractiveCardTestView()
}

#Preview("Normal View") {
    CardView(person: Person.example, fullScreenMode: .constant(false))
}

#Preview("Full Screen") {
    CardView(person: Person.example, fullScreenMode: .constant(true))
}
