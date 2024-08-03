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
    @Published var colorGroup: PersonalColor // Published property to store the current color group
    @Published var productList: [Product] // Published property to store the list of products
    @Published var showingFavs: Bool // Published property to track if only favorite products are shown
    @Published var favouriteProducts: Set<Int> // Published property to store the IDs of favorite products
    
    // Computed property to filter products based on the showingFavs flag
    var filteredProducts: [Product] {
        if showingFavs {
            return productList.filter { favouriteProducts.contains($0.id)
            }
        } else {
            return productList
        }
    }
    
    // Initializer to set up initial values
    init() {
        self.colorGroup = personalColors[0]
        self.productList = products
        self.showingFavs = false
        self.favouriteProducts = []
    }
    
    // Function to toggle the showingFavs flag with animation
    func sortFavs() {
        withAnimation {
            showingFavs.toggle()
        }
    }
    
    // Function to check if a product is in the favorite products set
    func contains(_ product: Product) -> Bool {
        favouriteProducts.contains(product.id)
    }
    
    // Function to toggle a product's favorite status
    func toggleFav(product: Product) {
        if contains(product) { // If the product is already a favorite
            favouriteProducts.remove(product.id) // Remove it from the favorite products set
        } else { // If the product is not a favorite
            favouriteProducts.insert(product.id) // Add it to the favorite products set
        }
    }
}
