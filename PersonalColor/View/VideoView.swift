//
//  VideoView.swift
//  PersonalColor
//
//  Created by Nana on 28/7/24.
//
/*
  RMIT University Vietnam
  Course: COSC2659|COSC2813 iOS Development
  Semester: 2024B
  Assessment: Assignment 1
  Author: Nguyen Tran Ha Anh
  ID: s3938490
  Created date: 28/07/2024
  Last modified: 02/08/2024
  Acknowledgement: Acknowledge the resources that you use here.
    https://www.youtube.com/watch?v=3uEbkUmS29A
 */

import SwiftUI
import WebKit

struct VideoView: View {
    var product: Product
    
    var body: some View {
        Video(videoID: product.video)
            .frame(width: 350, height: 400)
            .padding(.top, 50)
    }
}

struct Video: UIViewRepresentable {
    
    let videoID: String
    
    func makeUIView(context: Context) -> some WKWebView {
       return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/shorts/\(videoID)")
        else {
            return
        }
        
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}

#Preview {
    VideoView(product: products[0])
}


