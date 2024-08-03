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
    @ObservedObject var viewModel: ViewModel // ObservedObject to manage data
    @State private var activeID: Int? // State variable to track the active ID
    
    var body: some View {
        GeometryReader {
            let size = $0.size // Get the size of the geometry
            let padding = (size.width - 100) / 2 // Calculate the padding for the carousel
            
            ScrollView(.horizontal, showsIndicators: false) { // Horizontal scroll view without indicators
                HStack(spacing: 25) {
                    ForEach(personalColors) { color in
                        Image(color.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(.circle)
                            .shadow(color: .black.opacity(0.15), radius: 5, x: 5, y: 5)
                            .visualEffect { view, proxy in // Apply a visual effect based on the proxy
                                view
                                    .offset(y: offset(proxy)) // Offset the view vertically
                            }
                            .scrollTransition(.interactive, axis: .horizontal) {
                                view, phase in // Apply a scroll transition
                                view
                                    .scaleEffect(phase.isIdentity ? 1.2 : 0.75) // Scale the view based on the phase
                            }
                    }
                }
                .scrollTargetLayout() // Layout for scroll targets
                .frame(height: 180)
                .offset(y: -30)
            }
            .onChange(of: activeID, initial: true) { _ ,newValue  in // Listen for changes in activeID
                if let id = newValue {
                    viewModel.colorGroup = personalColors.first(where: { $0.id == id })! // Update the colorGroup in the viewModel
                }
            }
            .safeAreaPadding(.horizontal, padding)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)  // Align the scroll target to the view
            .scrollPosition(id: $activeID) // Set the scroll position
        }
        .frame(height: 140)
    }
    
    // Function to calculate the offset
    nonisolated func offset(_ proxy: GeometryProxy) -> CGFloat {
        let progress = progress(proxy)
        return progress < 0 ? progress * -30 : progress * 30
    }
    
    // Function to calculate the progress
    nonisolated func progress(_ proxy: GeometryProxy) -> CGFloat {
        let viewWidth = proxy.size.width // Get the view width
        let minX = (proxy.bounds(of: .scrollView)?.minX ?? 0)  // Get the minX of the scroll view
        return minX/viewWidth
    }
}

struct Carousel_Previews: PreviewProvider {
    @StateObject static var viewModel = ViewModel()

    static var previews: some View {
        Carousel(viewModel: viewModel)
    }
}
