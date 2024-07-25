//
//  Dialog.swift
//  PersonalColor
//
//  Created by Nana on 23/7/24.
//

import SwiftUI

struct Dialog: View {
    @Binding var showingAlert: Bool
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .stroke(Color("title"), lineWidth: 2.0)
                .frame(width: 330, height: 350)
//                .background(Color("background"))
                .background(Color("white"))
            
            VStack(spacing: 30) {
                Text("💖 Authur Information 💖")
                    .font(Font.custom("DancingScript-Bold", size: 30))
                
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Name:")
                            .font(Font.custom("Fustat-Bold", size: 20))
                        
                        Text("Nguyen Tran Ha Anh")
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
                    showingAlert = false
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
            
//            Button(action: {}, label: {
                Image(systemName: "x.circle")
                    .foregroundColor(Color("title"))
                    .offset(x: 140, y: -150)
                    .onTapGesture {
                        showingAlert = false
                    }
//            })
        
        }
        .transition(.scale)
    }
}

#Preview {
    Dialog(showingAlert: .constant(true))
}
