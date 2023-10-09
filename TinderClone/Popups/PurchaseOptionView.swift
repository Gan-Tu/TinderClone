//
//  PurchaseOptionView.swift
//  TinderClone
//
//  Created by Gan Tu on 10/8/23.
//

import SwiftUI

struct PurchaseOptionView: View {
    var sub: Subscription
    var isSelected: Bool

    var body: some View {
        VStack(spacing: 0) {
            Text("\(sub.month)")
                .font(.system(size: 44, weight: .light))
            
            Spacer().frame(height: 2)
            
            Text("month\(sub.month > 1 ? "s" : "")")
                .font(.system(size: 14, weight: isSelected ? .bold : .regular))
            
            Spacer().frame(height: 2)
            
            Text("$\(String(format: "%.2f", sub.monthlyCost))/mo")
                .foregroundStyle(Color.textPrimary)
            
            Spacer().frame(height: 2)
            
            if sub.savedPercent != nil {
                Text("Save \(sub.savedPercent ?? 0) %")
                    .foregroundStyle(Color.yellow)
                    .font(.system(size: 14, weight: .heavy))
                    .frame(height: 22)
            } else {
                Spacer().frame(height: 22)
            }
            
            Text("$\(String(format: "%.2f", sub.totalCost))")
                .font(.system(size: 20, weight: .bold))
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 18)
        .if(!isSelected) {
            $0.foregroundColor(Color.textPrimary)
        }
        .if(isSelected && sub.tagLine == .none) {
            $0.overlay {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.yellow, lineWidth: 1.5)
            }
        }
        .if(isSelected && sub.tagLine != .none) {
            $0.overlay {
                ZStack(alignment: .top) {
                    Rectangle()
                        .foregroundStyle(Color.yellow)
                        .frame(height: 20)
                        .cornerRadius(radius: 10, corners: [.topLeft, .topRight])
                    
                    Text(sub.tagLine.rawValue)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(Color.white)
                        .lineLimit(1)
                        .padding(.top, 2)
                        .padding(.horizontal, 6)
                        // Sets the minimum amount that text in this view
                        // scales down to fit in the available space.
                        .minimumScaleFactor(0.1)
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.yellow, lineWidth: 1.5)
                }
            }
        }
    }
}

#Preview {
    VStack {
        HStack(spacing: 10) {
            PurchaseOptionView(sub: .monthly, isSelected: false)
            PurchaseOptionView(sub: .threeMonth, isSelected: true)
            PurchaseOptionView(sub: .sixMonth, isSelected: true)
        }
        HStack(spacing: 10) {
            PurchaseOptionView(sub: .monthly, isSelected: true)
            PurchaseOptionView(sub: .threeMonth, isSelected: false)
            PurchaseOptionView(sub: .sixMonth, isSelected: false)
        }
    }
}
