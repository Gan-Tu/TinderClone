//
//  CardStack.swift
//  TinderClone
//
//  Created by Gan Tu on 10/15/23.
//

import SwiftUI

struct CardStack: View {
    var people: [Person]

    @State private var fullScreenMode = false
    
    let screen = UIScreen.main.bounds

    var body: some View {
        ZStack {
            // Can be optimized
            ForEach(people) { person in
                CardView(person: person, fullScreenMode: $fullScreenMode)
            }
        }
        .frame(width: screen.width, height: fullScreenMode ? screen.height : 550)
    }
}

#Preview {
    CardStack(people: Person.allExamples)
}
