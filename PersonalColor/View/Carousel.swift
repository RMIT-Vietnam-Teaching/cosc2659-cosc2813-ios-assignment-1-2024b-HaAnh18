//
//  Carousel.swift
//  PersonalColor
//
//  Created by Nana on 16/7/24.
//

import SwiftUI

struct Carousel: View {
//    @State private var pickerType: TripPicker = .normal
    @State private var activeID: Int?
//    @State private var activeCategory: Category? = categories[categories.count / 2]

    @Binding var activeColor: PersonalColor?
    var body: some View {
        VStack {
            GeometryReader {
                let size = $0.size
                let padding = (size.width - 100) / 2
                let middleIndex = personalColor.count / 2
  
                ScrollViewReader { scrollProxy in
                    ScrollView(.horizontal, showsIndicators: false) {
        
                        HStack(spacing: 25) {
                            ForEach(personalColor) { color in
                                VStack {
                                    color.image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
//                                        .clipShape(.rect(cornerRadius: 15))
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
//
                                        }
                                }
//                                        .id(category.id)
                                
                            }
                            
                        }
                        .scrollTargetLayout()
                        .frame(height: 180)
                        .offset(y: -30)
                    }
                    .onAppear(perform: {
                        DispatchQueue.main.async {
                            scrollProxy.scrollTo(middleIndex, anchor: .center)
//                            activeID = categories[middleIndex]
                            activeID = middleIndex
                            activeColor = personalColor[middleIndex]
                        }
                    })
                    .onChange(of: activeID, initial: true) { _ ,newValue  in
                        if let id = newValue {
                            activeColor = personalColor.first(where: { $0.id == id })
                        }
                    }
                    .safeAreaPadding(.horizontal, padding)
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.viewAligned)
                    .scrollPosition(id: $activeID)
                    
                }
                
            }
            .frame(height: 140)
        }
        .ignoresSafeArea(.container,edges: .bottom)
    }
    
    func offset(_ proxy: GeometryProxy) -> CGFloat {
        let progress = progress(proxy)
        return progress < 0 ? progress * -30 : progress * 30
    }
    
    func progress(_ proxy: GeometryProxy) -> CGFloat {
        let viewWidth = proxy.size.width
        let minX = (proxy.bounds(of: .scrollView)?.minX ?? 0)
        return minX/viewWidth
    }
}


//#Preview {
//    Carousel()
//    
//}
