//
//  VideoView.swift
//  PersonalColor
//
//  Created by Nana on 22/7/24.
//

import SwiftUI
import AVKit

struct VideoView: View {
    var product: Product

    
    var body: some View {
        let url = Bundle.main.url(forResource: product.video, withExtension: "mov")
//        
        VideoPlayer(player: AVPlayer(url: url!))
            .frame(width: 300, height: 300)
    }
}

#Preview {
//    VideoView()
//    Test()
    WelcomeView()
}
