//
//  NavigationBar.swift
//  PersonalColor
//
//  Created by Nana on 16/7/24.
//

import SwiftUI

struct NavigationBar: View {
    @State private var favouriteState = "heart"
    @ObservedObject var viewModel: ViewModel
    @Binding var isDarkMode: Bool

    var body: some View {
//        ZStack {
//            Color(.blue)
//                .ignoresSafeArea()
            
            
//        }
        
        GeometryReader { geo in
            let width = geo.size.width
            HStack(spacing: 0) {
                Button(action: {}, label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title)
                        .foregroundColor(Color("black"))
                    
                })
                .frame(width: width / 3 - 30)
//                .background(.yellow)
                
                Text("Explore")
//                    .font(Font.custom("DancingScript-Bold", size: 40))
//                    .font(Font.custom("BodoniModaSC_48pt-Medium", size: 40))
                    .font(Font.custom("PlayfairDisplay-Bold", size: 40))
//                    .textCase(.uppercase)
//                    .background(.pink)
                    .frame(width: width / 3 + 60)
                
                HStack {
                    Button(action: {
                        viewModel.sortFavs()
                    }, label: {
                        Image(systemName: viewModel.showingFavs ? "heart.fill" : "heart")
                            .font(.title)
                            .foregroundColor(Color("black"))
                        
                    })
                    
                    Button(action: {
                        isDarkMode.toggle()
                    }, label: {
                        Image(systemName: isDarkMode ? "sun.max" : "moon.fill")
                            .font(.title)
                            .foregroundColor(Color("black"))
        
                    })
                    
                }
                .frame(width: width / 3 - 30)
//                .background(.blue)
            }
//            .background(.gray)
            .frame(width: width)
        }
        .frame(height: 50)
    }
}


enum FavouriteState: String {
    case favourite = "favourite"
    case normal = "heart"
}

#Preview {
//    NavigationBar()
    Test()
}
