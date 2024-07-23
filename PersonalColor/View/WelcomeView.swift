//
//  WelcomeView.swift
//  PersonalColor
//
//  Created by Nana on 23/7/24.
//

import SwiftUI

struct WelcomeView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = true
    @State private var showingAlert = false
    @State var isWelcomeActive: Bool = true

    var body: some View {
        NavigationView {
            ZStack {
                GreetingView()
                VStack(spacing: 50) {
                    Image("aoife")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400)
                    
                    NavigationLink {
                        NavigationList(isDarkMode: $isDarkMode)
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
                
                Button( action: {
                    showingAlert = showingAlert == true ? false : true
                }) {
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(Color("title"))
                              .font(.system(size: 24))
                }
                .offset(x: 160, y: 370)
                
                if showingAlert {
                    Dialog(showingAlert: $showingAlert)
                }
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    WelcomeView()
}
