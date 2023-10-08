//
//  PersonSquareView.swift
//  TinderClone
//
//  Created by Gan Tu on 10/8/23.
//

import SwiftUI
import KingfisherSwiftUI

struct PersonSquareView: View {
    var person: Person
    var blur: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottomLeading) {
                KFImage(person.imageURLS.first)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .if(blur) {
                        $0.blur(radius: 25)
                    }
                
                Text("\(person.name), \(person.age)")
                    .padding()
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .if(blur) {
                        $0.redacted(reason: .placeholder)
                    }
            }
            .cornerRadius(16)
        }
    }
}

#Preview {
    VStack {
        PersonSquareView(person: Person.example, blur: true)
        PersonSquareView(person: Person.example, blur: false)
    }
    .frame(width: 200, height: 500)
}
