//
//  ToolbarView.swift
//  PersonalColor
//
//  Created by Nana on 22/7/24.
//
/*
  RMIT University Vietnam
  Course: COSC2659|COSC2813 iOS Development
  Semester: 2024B
  Assessment: Assignment 1
  Author: Nguyen Tran Ha Anh
  ID: s3938490
  Created date: 22/07/2024
  Last modified: 02/08/2024
  Acknowledgement: Acknowledge the resources that you use here.
    https://stackoverflow.com/questions/74527314/swiftui-how-to-remove-back-button-from-navigationlink-on-next-page
*/

import SwiftUI

struct ToolbarView: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
//    @Binding var isDarkMode: Bool
    @Binding var colorScheme: ColorScheme?
    @Binding var appearanceMode: AppearanceMode
    @State private var showingSheet = false
    
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
                .frame(width: width / 3 - 40)
                
                Text(product.name)
                    .font(Font.custom("PlayfairDisplay-Bold", size: 20))
                    .frame(width: width / 3 + 80)
                
                HStack {
                    Image(systemName: viewModel.contains(product) ? "heart.fill" : "heart")
                        .font(.title)
                        .foregroundColor(Color("black"))
                        .onTapGesture {
                            viewModel.toggleFav(product: product)
                        }
                    
                    Button(action: {
                        showingSheet.toggle()
                    }, label: {
                        Image(systemName: colorScheme == .dark ? "sun.max"  : colorScheme == .light ? "moon" : "gearshape")
                            .font(.title)
                            .foregroundColor(Color("black"))
        
                    })
                    .sheet(isPresented: $showingSheet) {
                        DarkLightMode(appearanceMode: $appearanceMode, showingSheet: $showingSheet, colorScheme: $colorScheme, viewModel: viewModel)
                            .presentationDetents([.large, .medium, .fraction(0.35)])
                    }
                    
                    Spacer()
                }
                .frame(width: width / 3 - 40)
            }
            .frame(width: width)
        }
        .frame(height: 45)
        .background(Color(viewModel.colorGroup.backgroundColor))

    }
}

struct ToolbarView_Previews: PreviewProvider {
    @StateObject static var viewModel = ViewModel()

    static var previews: some View {
        ToolbarView(viewModel: viewModel, colorScheme: .constant(.light), appearanceMode: .constant(.light), product: products[0])
//        ToolbarView(viewModel: viewModel, isDarkMode: .constant(false), product: products[0])
    }
}
