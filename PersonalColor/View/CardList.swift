//
//  CardList.swift
//  PersonalColor
//
//  Created by Nana on 17/7/24.
//

import SwiftUI

struct CardList: View {
    @ObservedObject var viewModel: ViewModel
    @Binding var isDarkMode: Bool

    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var filterProducts: [Product]

    var body: some View {
//        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(filterProducts) { product in
                    NavigationLink {
                        Detail(viewModel: viewModel, isDarkMode: $isDarkMode, product: product)
                    } label: {
                        Card(viewModel: viewModel, product: product)
                            .padding(.horizontal, 10)
                    }
            }
        }
    }
}

#Preview {
//    CardList(filterProducts: products)
//    NavigationList()
//    Test()
    WelcomeView()
}
