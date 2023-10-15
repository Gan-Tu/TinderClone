//
//  CardView.swift
//  TinderClone
//
//  Created by Gan Tu on 10/15/23.
//

import SwiftUI

struct CardView: View {
    @State var person: Person   // @State ensures the changes to person is reflected
    
    @Binding var fullScreenMode: Bool
    
    let screenCutoff = (UIScreen.main.bounds.width / 2) * 0.8
    
    var body: some View {
        GeometryReader { geo in
            if fullScreenMode {
                Text("fullScreenMode")
            } else {
                CardImageScroller(person: person, fullScreenMode: $fullScreenMode)
                    .animation(.easeOut(duration: 0.2))
                    .frame(width: geo.size.width - 20, height: geo.size.height)
                    .padding(.leading, 10)
                    .offset(x: person.x, y: person.y)
                    .rotationEffect(.degrees(person.degree))
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                withAnimation(.easeOut(duration: 0.2)) {
                                    person.x = value.translation.width
                                    person.y = value.translation.height
                                    withAnimation(.easeOut(duration: 0.2)) {
                                        person.degree = Double((value.translation.width/25))
                                    }
                                }
                            })
                            .onEnded({ value in
                                withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 10, initialVelocity: 0)) {
                                    let width = value.translation.width
                                    if abs(width) <= screenCutoff {
                                        // snap back
                                        person.x = 0
                                        person.y = 0
                                        person.degree = 0
                                    }else if width > screenCutoff {
                                        // swipe right
                                        person.x = 500
                                        person.degree = 12
                                    } else if width < -screenCutoff {
                                        // swipe left
                                        person.x = -500
                                        person.degree = -12
                                    }
                                }
                            })
                    )
            }
        }
    }
}

#Preview("Full Screen") {
    CardView(person: Person.example, fullScreenMode: .constant(true))
}

#Preview("Normal View") {
    CardView(person: Person.example, fullScreenMode: .constant(false))
}
