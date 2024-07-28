//
//  WelcomeView.swift
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

struct WelcomeView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = true
    @State private var colorScheme: ColorScheme? = .light
    @State private var appearanceMode: AppearanceMode = .light
    @State var isWelcomeActive: Bool = true
    @State private var showingSheet = false

    var body: some View {
        NavigationStack {
            ZStack {
                GreetingView()
                VStack(spacing: 50) {

                    Image("aoife")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400)
                    
                    NavigationLink {
                        NavigationList(colorScheme: $colorScheme, appearanceMode: $appearanceMode)
                    } label: {
                        ZStack {
                            Color("title")
                                .frame(width: 300, height: 60)
                                .clipShape(Capsule())

                            Text("Get Started")
                                .foregroundColor(Color("background"))
                                .font(Font.custom("DancingScript-Bold", size: 35))
                        }
                    }
                }
                
                Button(action: {
                    showingSheet.toggle()
                }) {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(Color("title"))
                              .font(.system(size: 24))
                }
                .offset(x: 160, y: 370)
                .sheet(isPresented: $showingSheet) {
                    Dialog(showingInfo: $showingSheet)
                        .presentationDetents([.large, .medium, .fraction(0.4)])
                }
            }
        }
        .preferredColorScheme(colorScheme)
    }
}

enum AppearanceMode {
    case dark, light, system
}

#Preview {
    WelcomeView()
}
