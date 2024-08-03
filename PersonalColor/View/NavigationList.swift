//
//  NavigationList.swift
//  PersonalColor
//
//  Created by Nana on 16/7/24.
//
/*
  RMIT University Vietnam
  Course: COSC2659|COSC2813 iOS Development
  Semester: 2024B
  Assessment: Assignment 1
  Author: Nguyen Tran Ha Anh
  ID: s3938490
  Created date: 16/07/2024
  Last modified: 02/08/2024
  Acknowledgement: Acknowledge the resources that you use here.
    https://www.youtube.com/watch?v=oI_zsmA_M3g&t=196s
*/

import SwiftUI

struct NavigationList: View {
    @StateObject var viewModel = ViewModel()
    @State private var searchText:String = ""
    @State private var filter: String = "All"
    @State private var isFilter: Bool = false
    @State private var showingSheet = false
    @Binding var colorScheme: ColorScheme?
    @Binding var appearanceMode: AppearanceMode

    let filterOptions: [String] = ["All", "Palette", "Blush", "Lipstick"] // Filter options

    var body: some View {
        ZStack(alignment: .top) {
            Color(viewModel.colorGroup.backgroundColor)
                .ignoresSafeArea()

            NavigationBar(viewModel: viewModel, colorScheme: $colorScheme, appearanceMode: $appearanceMode)
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    Carousel(viewModel: viewModel)
                                                            
                    Text(viewModel.colorGroup.name)
                        .font(Font.custom("DancingScript-Bold", size: 60))
                        .foregroundColor(Color(viewModel.colorGroup.color))
                    
                    ZStack(alignment: .top) {
                        CardList(viewModel: viewModel, colorScheme: $colorScheme, appearanceMode: $appearanceMode, filterProducts: viewModel.filteredProducts)
                            .padding(.top, 70)
                            .onAppear{
                                filterProducts() // Filter products on appear
                            }
                            .onChange(of: viewModel.colorGroup, initial: true, {
                                filterProducts() // Filter products on change
                            })
                        
                        FilterView(isFilter: $isFilter, colorGroup: $viewModel.colorGroup, searchText: $searchText, filter: $filter, filterFunction: filterProducts)
                            .overlay(content: {
                                if isFilter { // Show filter options if isFilter is true
                                    ZStack(alignment: .top) {
                                        RoundedRectangle(cornerRadius: 25.0)
                                            .frame(width: 150)
                                            .foregroundColor(Color(viewModel.colorGroup.backgroundColor))
                                            .shadow(color: Color(viewModel.colorGroup.color).opacity(0.3) ,radius: 2)
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 0)
                                        
                                        VStack {
                                            ForEach(Array(zip(self.filterOptions.indices, self.filterOptions)), id: \.0, content: { index, name in
                                                Button(action: {
                                                    filter = name
                                                    filterProducts()
                                                }, label: {
                                                    Text(name)
                                                        .font(Font.custom(filter == name ? "Fustat-Bold" : "Fustat-Light", size: 18))
                                                        .foregroundColor(Color(viewModel.colorGroup.color))
                                                        .frame(alignment: .topLeading)
                                                        .multilineTextAlignment(.leading)
                                                })
                                                .frame(width: 100, alignment: .leading)
                                                .padding(.vertical, 5)
                                            }
                                            )
                                        }
                                        .padding(.vertical, 5)
                                    }
                                    .offset(x: -110, y: 110)
                                }
                            })
                    }
                }
            }
            .padding(.top, 70)
            .toolbar(.hidden)
            
            Button(action: {
                showingSheet.toggle() // Toggle sheet visibility
            }, label: {
                Image(systemName: "camera")
                    .font(.title)
                    .background {
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(Color(viewModel.colorGroup.color))
                    }
                    .foregroundColor(Color(viewModel.colorGroup.backgroundColor))
                    
            })
            .offset(x: 150, y: 725)
            .sheet(isPresented: $showingSheet) { // Present sheet when showingSheet is true
                TestColorCamera(showingCamera: $showingSheet, currentBackgroundImageIndex: $viewModel.colorGroup.id)
            }
        }
        
    }
    
    // Function to capitalize words
    private func capitalizedWords(word: String) -> String {
            return word.lowercased().split(separator: " ").map { $0.capitalized }.joined(separator: " ")
        }
    
    // Function to filter products
    private func filterProducts() {
        viewModel.productList = products.filter { product in
            return product.personalColor == viewModel.colorGroup.name
        }
        
        if filter != "All" && filter != "" {
            viewModel.productList = viewModel.productList.filter { product in
                return product.category.contains(filter)
            }
        }
        
        if searchText != "" { // Apply search filter if searchText is not empty
            let capitalSearchText = capitalizedWords(word: searchText)
            viewModel.productList = viewModel.productList.filter { product in
                return product.name.contains(capitalSearchText) || product.brand.contains(capitalSearchText) ||
                product.category.contains(capitalSearchText)
            }
        }
            
    }
}

struct FilterView: View {
    @Binding var isFilter: Bool
    @Binding var colorGroup: PersonalColor
    @Binding var searchText: String
    @Binding var filter: String
    
    let filterFunction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 12) {
                Button(action: {
                    isFilter = isFilter == false ? true : false
                }, label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title)
                        .foregroundColor(Color(colorGroup.color))
                })
                
                HStack(spacing: 12) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(colorGroup.color))
                    
                    TextField("Search", text: $searchText)
                        .foregroundColor(Color(colorGroup.color))
                        .onChange(of: searchText, initial: true) { _, newValue in
                            filterFunction()
                        }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .background(
                    Capsule()
                        .strokeBorder(Color(colorGroup.color),lineWidth: 0.8)
                    )
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    NavigationList(colorScheme: .constant(.light), appearanceMode: .constant(.light))
}

