//
//  Dialog.swift
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
    https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-new-view-using-sheets
*/

import SwiftUI

struct Dialog: View {
    @Binding var showingInfo: Bool
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Color("white-custom")
                
            VStack(spacing: 30) {
                Text("💖 Author's Information 💖")
                    .font(Font.custom("DancingScript-Bold", size: 35))
                    .padding(.top, 30)
                
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Name:")
                            .font(Font.custom("Fustat-Bold", size: 20))
                        
                        Text("Nguyen Tran Ha Anh (Nana)")
                            .font(Font.custom("Fustat-Light", size: 20))
                    }
                    
                    HStack {
                        Text("sID:")
                            .font(Font.custom("Fustat-Bold", size: 20))
                        
                        Text("s3938490")
                            .font(Font.custom("Fustat-Light", size: 20))
                    }
                    
                    HStack {
                        Text("Program:")
                            .font(Font.custom("Fustat-Bold", size: 20))
                        
                        Text("Information Technology")
                            .font(Font.custom("Fustat-Light", size: 20))
                    }
                }
                
                Button(action: {
                    showingInfo.toggle()
                }, label: {
                    Capsule()
                        .stroke(Color("title"), lineWidth: 2.0)
                        .frame(width: 230, height: 50)
                        .overlay {
                            Text("Love it ")
                                .font(Font.custom("Fustat-Bold", size: 20))
                                .foregroundColor(Color("title"))
                        }
                })
            }
        }
        .transition(.scale)
    }
}

#Preview {
    Dialog(showingInfo: .constant(true))
}
