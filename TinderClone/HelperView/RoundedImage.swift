//
//  RoundedImage.swift
//  TinderClone
//
//  Created by Gan Tu on 9/4/23.
//

import SwiftUI
import KingfisherSwiftUI

struct RoundedImage: View {
    var url: URL?
    
    var body: some View {
        KFImage(url)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
    }
}

#Preview {
    RoundedImage(url: URL(string: "https://picsum.photos/400"))
}
