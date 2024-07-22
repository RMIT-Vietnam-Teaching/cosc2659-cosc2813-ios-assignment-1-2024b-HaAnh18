//
//  NavigationList.swift
//  PersonalColor
//
//  Created by Nana on 16/7/24.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var colorGroup: PersonalColor
    @Published var productList: [Product]
    @Published var showingFavs: Bool
    @Published var favouriteProducts: Set<Int>
    
    var filteredProducts: [Product] {
        if showingFavs {
            return productList.filter { favouriteProducts.contains($0.id)
            }
        } else {
            return productList
        }
    }
    
    init() {
        self.colorGroup = personalColors[0]
        self.productList = products
        self.showingFavs = false
        self.favouriteProducts = [1]
    }
    
    func sortFavs() {
        withAnimation {
            showingFavs.toggle()
        }
    }
    
    func contains(_ product: Product) -> Bool {
        favouriteProducts.contains(product.id)
    }
    
    func toggleFav(product: Product) {
        if contains(product) {
            favouriteProducts.remove(product.id)
        } else {
            favouriteProducts.insert(product.id) 
        }
    }
}

struct NavigationList: View {
    @StateObject var viewModel = ViewModel()
    @State private var searchText:String = ""
    @State private var filter: String = "All"
    @State private var isFilter: Bool = false
    @Binding var isDarkMode: Bool
    
    let filterOptions: [String] = ["All", "Palette", "Lipstick"]

    var body: some View {
        ZStack {
            Color(viewModel.colorGroup.backgroundColor)
                .ignoresSafeArea()

            
            ScrollView {
                VStack(spacing: 20) {
                    NavigationBar(viewModel: viewModel, isDarkMode: $isDarkMode)
                    
                    Carousel(viewModel: viewModel)
                                                            
                    Text(viewModel.colorGroup.name)
                        .font(Font.custom("DancingScript-Bold", size: 60))
                        .foregroundColor(Color(viewModel.colorGroup.color))
//                        .background(.white)
                    
                    ZStack(alignment: .top) {
                        CardList(viewModel: viewModel, isDarkMode: $isDarkMode, filterProducts: viewModel.filteredProducts)
                            .padding(.top, 70)
                        .onAppear{
                            filterProducts()
                        }
                        .onChange(of: viewModel.colorGroup, initial: true, {
                            filterProducts()
                        })
                        
                        FilterView(isFilter: $isFilter, colorGroup: $viewModel.colorGroup, searchText: $searchText, filter: $filter)
                            .overlay(content: {
                                if isFilter {
                                    ZStack(alignment: .top) {
                                        RoundedRectangle(cornerRadius: 25.0)
                                            .frame(width: 150, height: 200)
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
                                                })
                                                .frame(width: 100, alignment: .leading)
                                                .padding(.horizontal, 10)
                                                .padding(.vertical, 5)
                                            })
                                        }
                                        .padding(.top, 20)
                                        
                                    }
                                    .offset(x: -110, y: 130)
                                }
                            })
                    }
                }
            }
           
        }
        
    }
    
    private func filterProducts() {
        viewModel.productList = products.filter { product in
            return product.personalColor == viewModel.colorGroup.name
        }
        if filter != "All" && filter != "" {
            viewModel.productList = viewModel.productList.filter { product in
                return product.category == filter
            }
        }
            
    }
}

struct FilterView: View {
    @Binding var isFilter: Bool
    @Binding var colorGroup: PersonalColor
    @Binding var searchText: String
    @Binding var filter: String
    
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
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .background(
                    Capsule()
                        .strokeBorder(Color(colorGroup.color),lineWidth: 0.8)
//                                            .background(Color.blue)
                    )
            }
            .padding(.horizontal, 20)
        }
    }
    
}

#Preview {
//    NavigationList()
    Test()
}
