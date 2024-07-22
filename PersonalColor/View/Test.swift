//
//  Test.swift
//  PersonalColor
//
//  Created by Nana on 21/7/24.
//

import SwiftUI

struct Test: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = true

    var body: some View {
        NavigationStack {
            NavigationList(isDarkMode: $isDarkMode)
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
    
    
}

#Preview {
    Test()
}
