//
//  GreetingView.swift
//  PersonalColor
//
//  Created by Nana on 23/7/24.
//

import SwiftUI

struct GreetingView: View {

    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            Image("berry-smoothie-1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .offset(x: 20, y: -320)
                .rotationEffect(.degrees(-20))
            
            Image("cool-pink-2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250)
                .offset(x: -80, y: -140)
                .rotationEffect(.degrees(140))

            Image("chillin-1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .offset(x: -240, y: 280)
                .rotationEffect(.degrees(-20))
        }
    }
}

#Preview {
    GreetingView()
}


