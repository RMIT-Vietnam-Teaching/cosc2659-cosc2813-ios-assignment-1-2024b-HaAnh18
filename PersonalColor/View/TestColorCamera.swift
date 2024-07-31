//
//  TestColorCamera.swift
//  PersonalColor
//
//  Created by Nana on 31/7/24.
//

import SwiftUI

struct TestColorCamera: View {
    @State private var currentBackgroundImageIndex = 0
    @State private var capturedImage: UIImage? = nil
    @State private var showCameraView = true
    @Binding var showingCamera: Bool

    let backgroundImages = ["spring-bg", "summer-bg", "autumn-bg", "winter-bg"]
    
    var body: some View {
        ZStack {
            CameraView()
            GeometryReader { geometry in
                Image(backgroundImages[currentBackgroundImageIndex])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
              

            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            currentBackgroundImageIndex = (currentBackgroundImageIndex + 1) % backgroundImages.count
        }
        
    }
}

#Preview {
    TestColorCamera(showingCamera: .constant(true))
}
