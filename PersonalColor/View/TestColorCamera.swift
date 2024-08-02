//
//  TestColorCamera.swift
//  PersonalColor
//
//  Created by Nana on 31/7/24.
//
/*
  RMIT University Vietnam
  Course: COSC2659|COSC2813 iOS Development
  Semester: 2024B
  Assessment: Assignment 1
  Author: Nguyen Tran Ha Anh
  ID: s3938490
  Created date: 31/07/2024
  Last modified: 02/08/2024
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct TestColorCamera: View {
    @State private var capturedImage: UIImage? = nil
    @State private var showCameraView = true
    @Binding var showingCamera: Bool
    @Binding var currentBackgroundImageIndex: Int

    let backgroundImages = ["spring-bg", "summer-bg", "autumn-bg", "winter-bg"]
    
    var body: some View {
        ZStack {
            CameraView()
            GeometryReader { geometry in
                Image(backgroundImages[(currentBackgroundImageIndex - 1 + backgroundImages.count) % backgroundImages.count])
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
    TestColorCamera(showingCamera: .constant(true), currentBackgroundImageIndex: .constant(1))
}
