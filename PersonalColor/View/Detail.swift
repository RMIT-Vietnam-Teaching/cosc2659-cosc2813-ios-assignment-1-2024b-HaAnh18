//
//  Detail.swift
//  PersonalColor
//
//  Created by Nana on 17/7/24.
//

import SwiftUI

struct Detail: View {
    @ObservedObject var viewModel: CurrentPersonalColor

    var product: Product
    
    var body: some View {
        ZStack {
            Color(viewModel.colorGroup.backgroundColor)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    ScrollImage(images: product.images)
                    
                    ShortDescription(product: product)
                   
                    DescriptionCard(viewModel: viewModel, product: product)
                    
                    TabViewStore(viewModel: viewModel, product: product)
                }
            }
            
        }
    }
}
      
struct ShortDescription: View {
    var product: Product
    var body: some View {
        HStack {
            Text(product.name)
                .font(Font.custom("PlayfairDisplay-Bold", size: 25))
            
            Spacer()
            
            HStack(spacing: 5) {
                Text("\(product.reviewStar, specifier: "%.1f")")    .font(Font.custom("Fustat-Light", size: 20))
                    .environment(\.locale, Locale(identifier: "en_US"))

                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
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

            Text(product.address)
                .font(Font.custom("Fustat-Light", size: 18))

            Spacer()
            
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
//    Detail()
    Test()
}
