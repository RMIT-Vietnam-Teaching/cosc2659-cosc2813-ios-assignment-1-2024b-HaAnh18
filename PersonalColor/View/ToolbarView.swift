//
//  ToolbarView.swift
//  PersonalColor
//
//  Created by Nana on 22/7/24.
//

import SwiftUI

struct ToolbarView: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @Binding var isDarkMode: Bool
    var product: Product
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            HStack(spacing: 0) {
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.backward")
                        .font(.title)
                        .foregroundColor(Color("black"))
                })
                .frame(width: width / 3 - 50)
//                .background(.yellow)
                
                Text(product.name)
//                    .font(Font.custom("DancingScript-Bold", size: 40))
//                    .font(Font.custom("BodoniModaSC_48pt-Medium", size: 40))
                    .font(Font.custom("PlayfairDisplay-Bold", size: 20))
//                    .textCase(.uppercase)
//                    .background(.pink)
                    .frame(width: width / 3 + 100)
                
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
                .frame(width: width / 3 - 50)
//                .background(.blue)
            }
//            .background(.blue)
//            .background(Color(viewModel.colorGroup.backgroundColor))
            .frame(width: width)
        }
        .frame(height: 45)
        .background(Color(viewModel.colorGroup.backgroundColor))

    }
}

#Preview {
//    ToolbarView()
    Test()
}
