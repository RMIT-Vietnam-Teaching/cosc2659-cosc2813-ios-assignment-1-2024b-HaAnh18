//
//  Background.swift
//  PersonalColor
//
//  Created by Nana on 16/7/24.
//

import SwiftUI

struct Background: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [.white,.white, Color("test").opacity(0.3)]), startPoint: .top, endPoint: .trailing)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    Background()
}
