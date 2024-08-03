//
//  CardList.swift
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
    https://www.hackingwithswift.com/quick-start/swiftui/how-to-position-views-in-a-grid-using-lazyvgrid-and-lazyhgrid
*/

import SwiftUI

struct CardList: View {
    @ObservedObject var viewModel: ViewModel
    @Binding var colorScheme: ColorScheme?
    @Binding var appearanceMode: AppearanceMode
    
    var filterProducts: [Product]
    let columns = [GridItem(.flexible()), GridItem(.flexible())] // Define a two-column grid with flexible items
    
    var body: some View {
        LazyVGrid(columns: columns) { // LazyVGrid with specified columns
            ForEach(filterProducts) { product in
                NavigationLink {
                    Detail(viewModel: viewModel, colorScheme: $colorScheme, appearanceMode: $appearanceMode, product: product) // Navigate to Detail view when tapped
                } label: {
                    Card(viewModel: viewModel, product: product)
                        .padding(.horizontal, 10)
                }
            }
        }
    }
}

struct CardList_Previews: PreviewProvider {
    @StateObject static var viewModel = ViewModel()

    static var previews: some View {
        CardList(viewModel: viewModel, colorScheme: .constant(.light), appearanceMode: .constant(.light), filterProducts: products)
    }
}
