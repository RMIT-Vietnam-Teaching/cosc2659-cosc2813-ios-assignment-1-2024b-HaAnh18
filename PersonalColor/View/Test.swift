//
//  Test.swift
//  PersonalColor
//
//  Created by Nana on 21/7/24.
//

import SwiftUI

struct Test: View {
    @StateObject var personalColor = CurrentPersonalColor()
//    let filter = products.filter { product in
//        return product.personalColor == "Warm Spring"
//    }
    var body: some View {
        NavigationView {
            NavigationList()
            
        }
    }
    
    
}

#Preview {
    Test()
}
