//
//  VideoDemo.swift
//  PersonalColor
//
//  Created by Nana on 25/7/24.
//

import SwiftUI
import AVKit
import WebKit

struct VideoDemo: View {
    let url = URL(string: "https://drive.google.com/file/d/1Z21sRRUP7xElV_5GEi1aosqCvWkWpCx-/view?usp=sharing")!
    var body: some View {
        ZStack {
            Video(videoID: "DAsOtPCj4Rg?si=PPLYI97-36KSDn6g")
                .frame(width: 300, height: 300)
        }
    }
}

struct Video: UIViewRepresentable {
    
    let videoID: String
    
    func makeUIView(context: Context) -> some WKWebView {
       return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")
        else {
            return
        }
        
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}

#Preview {
    VideoDemo()
}
