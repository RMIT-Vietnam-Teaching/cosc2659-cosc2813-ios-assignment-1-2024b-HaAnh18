//
//  CardList.swift
//  PersonalColor
//
//  Created by Nana on 17/7/24.
//

import SwiftUI

struct CardList: View {
    @ObservedObject var viewModel: CurrentPersonalColor

    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var filterProducts: [Product]

    var body: some View {
//        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(filterProducts) { product in
                    NavigationLink {
                        Detail(viewModel: viewModel, product: product)
                    } label: {
                        Card(product: product)
                            .padding(.horizontal, 10)
                    }
            }
        }
    }
}

#Preview {
//    CardList(filterProducts: products)
//    NavigationList()
    Test()
}
