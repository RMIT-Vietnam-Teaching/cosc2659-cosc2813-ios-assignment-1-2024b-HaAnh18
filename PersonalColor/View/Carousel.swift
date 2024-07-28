//
//  Carousel.swift
//  PersonalColor
//
//  Created by Nana on 16/7/24.
//
/*
  RMIT University Vietnam
  Course: COSC2659|COSC2813 iOS Development
  Semester: 2024B
  Assessment: Assignment 1
  Author: Nguyen Tran Ha Anh
  ID: s3938490
  Created date: 16/07/2024
  Last modified: 02/08/2024
  Acknowledgement: Acknowledge the resources that you use here.
    https://www.youtube.com/watch?v=oI_zsmA_M3g&t=196s
*/

import SwiftUI

struct Carousel: View {
    @State private var activeID: Int?

    @ObservedObject var viewModel: ViewModel
    var body: some View {
        GeometryReader {
            let size = $0.size
            let padding = (size.width - 100) / 2
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 25) {
                    ForEach(personalColors) { color in
                        Image(color.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(.circle)
                            .shadow(color: .black.opacity(0.15), radius: 5, x: 5, y: 5)
                            .visualEffect { view, proxy in
                                view
                                    .offset(y: offset(proxy))
                            }
                            .scrollTransition(.interactive, axis: .horizontal) {
                                view, phase in
                                view
                                    .scaleEffect(phase.isIdentity ? 1.2 : 0.75)
                            }
                    }
                }
                .scrollTargetLayout()
                .frame(height: 180)
                .offset(y: -30)
            }
            .onChange(of: activeID, initial: true) { _ ,newValue  in
                if let id = newValue {
                    viewModel.colorGroup = personalColors.first(where: { $0.id == id })!
                }
            }
            .safeAreaPadding(.horizontal, padding)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $activeID)
        }
        .frame(height: 140)
    }
    
    nonisolated func offset(_ proxy: GeometryProxy) -> CGFloat {
        let progress = progress(proxy)
        return progress < 0 ? progress * -30 : progress * 30
    }
    
    nonisolated func progress(_ proxy: GeometryProxy) -> CGFloat {
        let viewWidth = proxy.size.width
        let minX = (proxy.bounds(of: .scrollView)?.minX ?? 0)
        return minX/viewWidth
    }
}

struct Carousel_Previews: PreviewProvider {
    @StateObject static var viewModel = ViewModel()

    static var previews: some View {
        Carousel(viewModel: viewModel)
    }
}
