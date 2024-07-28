//
//  ViewModel.swift
//  PersonalColor
//
//  Created by Nana on 25/7/24.
//
/*
  RMIT University Vietnam
  Course: COSC2659|COSC2813 iOS Development
  Semester: 2024B
  Assessment: Assignment 1
  Author: Nguyen Tran Ha Anh
  ID: s3938490
  Created date: 25/07/2024
  Last modified: 02/08/2024
  Acknowledgement: Acknowledge the resources that you use here.
    https://www.youtube.com/watch?v=_lPU9SrBpRI&t=726s
 */

import Foundation
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
        self.favouriteProducts = []
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
