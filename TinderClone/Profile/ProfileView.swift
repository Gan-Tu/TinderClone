//
//  ProfileView.swift
//  TinderClone
//
//  Created by Gan Tu on 9/4/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Profile
            ZStack(alignment: .topTrailing) {
                RoundedImage(url: URL(string: "https://picsum.photos/400"))
                    .frame(height: 200)
                
                Button(action: {
                    // TODO
                }, label: {
                    Image(systemName: "pencil")
                        .font(.system(size: 18, weight: .heavy))
                        .foregroundStyle(Color.gray.opacity(0.5))
                        .frame(width: 32, height: 32)
                        .background(Color.white)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .shadow(radius: 6)
                })
                .padding(.vertical, 10)
                .offset(x: -10)
            }
            
            Spacer().frame(height: 18)
            
            // MARK: - Name
            Text("Gan, 26")
                .foregroundStyle(Color.textTitle)
                .font(.system(size: 26, weight: .medium))
            
            Spacer().frame(height: 8)
            
            // MARK: - Title
            Text("Software Engineer")
            
            Spacer().frame(height: 22)
            
            // MARK: - Actions
            HStack(alignment: .top) {
                Spacer()

                // MARK: - Settings
                Button(action: {
                    // TODO
                }, label: {
                    VStack {
                        Image(systemName: "gearshape.fill")
                            .foregroundStyle(Color.gray.opacity(0.5))
                            .font(.system(size: 30))
                            .padding(10)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                        
                        Text("SETTINGS")
                            .font(.system(size: 14 ,weight: .medium))
                            .foregroundStyle(Color.textSecondary)
                    }
                })
                
                // MARK: - MEDIA
                Button(action: {
                    // TODO
                }, label: {
                    VStack {
                        Image(systemName: "camera.fill")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 38))
                            .padding(22)
                            .background(Color.red)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                        
                        Text("ADD MEDIA")
                            .font(.system(size: 14 ,weight: .medium))
                            .foregroundStyle(Color.textSecondary)
                    }
                })
                
                // MARK: - Settings
                Button(action: {
                    // TODO
                }, label: {
                    VStack {
                        Image(systemName: "shield.fill")
                            .foregroundStyle(Color.gray.opacity(0.5))
                            .font(.system(size: 30))
                            .padding(10)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                        
                        Text("SAFETY")
                            .font(.system(size: 14 ,weight: .medium))
                            .foregroundStyle(Color.textSecondary)
                    }
                })
                
                Spacer()
            }
            
            Spacer().frame(height: 13)
            
            // MARK: - Tip
            HStack {
                Text("Photo Tip: Make waves with a beach photo and get more likes")
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                
                Button(action: {
                    // TODO
                }, label: {
                    Image(systemName: "plus")
                        .font(.system(size: 12, weight: .heavy))
                        .foregroundColor(.pink)
                        .padding(6)
                })
                .background(Color.white)
                .clipShape(Circle())
            }
            .padding()
            .background(Color.pink)
            .cornerRadius(12)
            .padding(.horizontal, 8)
            
            // MARK: - Promotions
            
            Spacer()
        }
    }
}

#Preview {
    ProfileView()
        .background(Color.defaultBackground)
}
