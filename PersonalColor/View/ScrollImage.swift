//
//  ScrollImage.swift
//  PersonalColor
//
//  Created by Nana on 17/7/24.
//
/*
  RMIT University Vietnam
  Course: COSC2659|COSC2813 iOS Development
  Semester: 2024B
  Assessment: Assignment 1
  Author: Nguyen Tran Ha Anh
  ID: s3938490
  Created date: 17/07/2024
  Last modified: 02/08/2024
  Acknowledgement: Acknowledge the resources that you use here.
    https://www.youtube.com/watch?v=3zBSgXoSugU
 */

import SwiftUI

struct ScrollImage: View {
    var images: [String]
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(Array(zip(self.images.indices, self.images)), id: \.0) { index, name in
                        Image(name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: size.width / 2)
                            .shadow(color: .black.opacity(0.15), radius: 5, x: 5, y: 5)
                            .scrollTransition(.interactive, axis: .horizontal) {
                                view, phase in
                                view
                                    .scaleEffect(phase.isIdentity ? 1 : 0.4)
                            }
                    }
                }
                .scrollTargetLayout()
                .frame(height: 200)
                .padding(.horizontal, size.width / 2 - 100)
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
        }
        .frame(height: 200)
    }
}

#Preview {
    ScrollImage(images: products[0].images)
}
