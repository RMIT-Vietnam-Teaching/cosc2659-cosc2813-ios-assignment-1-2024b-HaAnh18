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

    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            HStack(spacing: 0) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "house")
                        .font(.title)
                        .foregroundColor(Color("black"))
                    
                })
                .frame(width: width / 3 - 30)
                Text("Aoife")
                    .font(Font.custom("PlayfairDisplay-Bold", size: 40))
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
                        Image(systemName: isDarkMode ? "sun.max" : "moon")
                            .font(.title)
                            .foregroundColor(Color("black"))
        
                    })
                }
                .frame(width: width / 3 - 30)
            }
            .frame(width: width)
        }
        
    }
    
}

#Preview {
//    NavigationBar()
//    Test()
    WelcomeView()
}
