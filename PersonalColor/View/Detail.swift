//
//  Detail.swift
//  PersonalColor
//
//  Created by Nana on 17/7/24.
//

import SwiftUI

struct Detail: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @Binding var isDarkMode: Bool
    
    var product: Product
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(viewModel.colorGroup.backgroundColor)
                .ignoresSafeArea()
            
            ToolbarView(viewModel: viewModel, isDarkMode: $isDarkMode, product: product)
                .zIndex(1)
            
            ScrollView {
                VStack(spacing: 20) {
                    ScrollImage(images: product.images)
                    
                    ShortDescription(product: product)
                   
                    DescriptionCard(viewModel: viewModel, product: product)
                    
                    TabViewStore(viewModel: viewModel, product: product)
                }
            }
            .zIndex(2)
            .padding(.top, 40)
           
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}
      
struct ShortDescription: View {
    var product: Product
    var body: some View {
        HStack {
            Text(product.name)
                .font(Font.custom("PlayfairDisplay-Bold", size: 25))
                .frame(height: 20)
            
            Spacer()
            
            HStack(spacing: 5) {
                Text("\(product.reviewStar, specifier: "%.1f")")    .font(Font.custom("Fustat-Light", size: 20))
                    .environment(\.locale, Locale(identifier: "en_US"))

                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            .frame(height: 20)
        }
        .padding(.horizontal, 20)

        
        HStack(spacing: 10) {
            Text("Brand:")
                .font(Font.custom("Fustat-Bold", size: 18))

            Text(product.brand)
                .font(Font.custom("Fustat-Light", size: 18))

            Spacer()
            
        }
        .padding(.horizontal, 20)
        
        HStack(spacing: 10) {
            Text("Category:")
                .font(Font.custom("Fustat-Bold", size: 18))

            Text(product.category)
                .font(Font.custom("Fustat-Light", size: 18))

            Spacer()
            
        }
        .padding(.horizontal, 20)
        
        HStack(spacing: 10) {
            Text("Personal Colour:")
                .font(Font.custom("Fustat-Bold", size: 18))

            Text(product.personalColor)
                .font(Font.custom("Fustat-Light", size: 18))

            Spacer()
            
        }
        .padding(.horizontal, 20)
        
        HStack(spacing: 10) {
            Text("Address:")
                .font(Font.custom("Fustat-Bold", size: 18))
                .frame(alignment: .top)

            Text(product.offlineStore ? product.address : "Online Store Only in Vietnam")
                .font(Font.custom("Fustat-Light", size: 18))

            Spacer()
            
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
//    Detail()
//    Test()
    WelcomeView()
}
