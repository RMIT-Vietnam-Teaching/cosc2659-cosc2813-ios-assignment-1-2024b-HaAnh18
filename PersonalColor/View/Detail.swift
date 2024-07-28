//
//  Detail.swift
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
    https://stackoverflow.com/questions/74527314/swiftui-how-to-remove-back-button-from-navigationlink-on-next-page
*/

import SwiftUI

struct Detail: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
//    @Binding var isDarkMode: Bool
    @Binding var colorScheme: ColorScheme?
    @Binding var appearanceMode: AppearanceMode
    
    var product: Product
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(viewModel.colorGroup.backgroundColor)
                .ignoresSafeArea()
            
            ToolbarView(viewModel: viewModel, colorScheme: $colorScheme, appearanceMode: $appearanceMode, product: product)
//            ToolbarView(viewModel: viewModel, isDarkMode: $isDarkMode, product: product)
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
            
            HStack(alignment: .center, spacing: 5) {
                Text("\(product.reviewStar, specifier: "%.1f")")    .font(Font.custom("Fustat-Light", size: 20))
                    .environment(\.locale, Locale(identifier: "en_US"))

                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .offset(y: -3)
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

struct Detail_Previews: PreviewProvider {
    @StateObject static var viewModel = ViewModel()

    static var previews: some View {
        Detail(viewModel: viewModel, colorScheme: .constant(.light), appearanceMode: .constant(.light), product: products[0])
    }
}

