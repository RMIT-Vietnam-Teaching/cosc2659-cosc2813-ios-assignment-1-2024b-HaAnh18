//
//  CardList.swift
//  PersonalColor
//
//  Created by Nana on 17/7/24.
//

import SwiftUI

struct CardList: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ZStack {
            Color("spring-bg")
                .ignoresSafeArea()
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(0...5, id: \.self) { index in
                        Card()
                            .padding(.horizontal, 10)
                    }
                }
            }
        }
    }
}

#Preview {
    CardList()
}
