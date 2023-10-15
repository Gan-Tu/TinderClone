//
//  CircleButtonView.swift
//  TinderClone
//
//  Created by Gan Tu on 10/15/23.
//

import SwiftUI

enum ButtonType: String {
    case back = "gobackward"
    case no = "xmark"
    case star = "star.fill"
    case heart = "heart.fill"
    case lightning = "cloud.bolt.fill"
}

struct CircleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                Circle().foregroundColor(.white)
            )
            .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
    }
}


struct ColorButton: ViewModifier {
    var type: ButtonType
    
    func body(content: Content) -> some View {
        switch type {
        case .back:
            return content.foregroundColor(.yellow)
        case .no:
            return content.foregroundColor(.red)
        case .star:
            return content.foregroundColor(.blue)
        case .heart:
            return content.foregroundColor(.green)
        case .lightning:
            return content.foregroundColor(.purple)
        }
    }
}

extension View {
    func colorButton(type: ButtonType) -> some View {
        self.modifier(ColorButton(type: type))
    }
}

struct CircleButtonView: View {
    var type: ButtonType
    var action: () -> Void

    var body: some View {
        Button(action: { action() }, label: {
            Image(systemName: type.rawValue)
                .resizable()
                .font(.system(size: 10, weight: .bold))
                .aspectRatio(contentMode: .fit)
                .padding(12)
        })
        .buttonStyle(CircleButton())
        .colorButton(type: type)
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2)
            .edgesIgnoringSafeArea(.all)
        
        VStack(spacing: 50, content: {
            CircleButtonView(type: .back, action: {
                // TODO
            })
            CircleButtonView(type: .no, action: {
                // TODO
            })
            CircleButtonView(type: .star, action: {
                // TODO
            })
            CircleButtonView(type: .heart, action: {
                // TODO
            })
            CircleButtonView(type: .lightning, action: {
                // TODO
            })
        })
    }
}
