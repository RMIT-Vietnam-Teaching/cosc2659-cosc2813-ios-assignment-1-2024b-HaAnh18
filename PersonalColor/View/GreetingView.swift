//
//  GreetingView.swift
//  PersonalColor
//
//  Created by Nana on 23/7/24.
//
/*
  RMIT University Vietnam
  Course: COSC2659|COSC2813 iOS Development
  Semester: 2024B
  Assessment: Assignment 1
  Author: Nguyen Tran Ha Anh
  ID: s3938490
  Created date: 23/07/2024
  Last modified: 02/08/2024
  Acknowledgement: Acknowledge the resources that you use here.
*/

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


