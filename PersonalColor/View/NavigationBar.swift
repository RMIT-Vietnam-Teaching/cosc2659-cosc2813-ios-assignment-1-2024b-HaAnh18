//
//  NavigationBar.swift
//  PersonalColor
//
//  Created by Nana on 16/7/24.
//

import SwiftUI

struct NavigationBar: View {
    @State private var favouriteState = "heart"
    var body: some View {
//        ZStack {
//            Color(.blue)
//                .ignoresSafeArea()
            
            HStack(spacing: 70) {
                Button(action: {}, label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title)
                        .foregroundColor(.black)
                    
                })
                
                Text("Explore")
//                    .font(Font.custom("DancingScript-Bold", size: 40))
//                    .font(Font.custom("BodoniModaSC_48pt-Medium", size: 40))
                    .font(Font.custom("PlayfairDisplay-Bold", size: 40))
//                    .textCase(.uppercase)
                
                Button(action: {
                    if favouriteState == "heart" {
                        favouriteState = "heart.fill"
                    } else {
                        favouriteState = "heart"
                    }
                }, label: {
                    Image(systemName: favouriteState)
                        .font(.title)
                        .foregroundColor(.black)
                    
                })
            }
//        }
    }
}


enum FavouriteState: String {
    case favourite = "favourite"
    case normal = "heart"
}

#Preview {
    NavigationBar()
}
