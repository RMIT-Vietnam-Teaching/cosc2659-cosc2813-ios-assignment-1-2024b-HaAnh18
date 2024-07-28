//
//  DarkLightMode.swift
//  PersonalColor
//
//  Created by Nana on 27/7/24.
//
/*
  RMIT University Vietnam
  Course: COSC2659|COSC2813 iOS Development
  Semester: 2024B
  Assessment: Assignment 1
  Author: Nguyen Tran Ha Anh
  ID: s3938490
  Created date: 27/07/2024
  Last modified: 02/08/2024
  Acknowledgement: Acknowledge the resources that you use here.
    https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-new-view-using-sheets
    https://www.youtube.com/watch?v=Cb5_LCBZFqs&t=1284s
*/

import SwiftUI

struct DarkLightMode: View {
    @Binding var appearanceMode: AppearanceMode
    @Binding var showingSheet: Bool
    @Binding var colorScheme: ColorScheme?
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        ZStack(alignment: .top) {
            Color("white")
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Appearance")
                    Spacer()
                    Image(systemName: "xmark.circle.fill")
                        .onTapGesture {
                            showingSheet.toggle()
                        }
                }
                .bold()
                .font(.title)
                .foregroundColor(Color(viewModel.colorGroup.color))
                .foregroundStyle(.primary)
                .padding()
                
                Divider()
                    .padding(.horizontal, 30)
                    .padding(.bottom, 10)
                                        
                HStack(spacing: 20) {
                    Button(action: {
                        appearanceMode = .light
                        colorScheme = .light
                    }, label: {
                        DarkLightButton(currentMode: $appearanceMode, viewModel: viewModel, mode: .light, name: "Light", color: "Light")
                    })
                    
                    Button(action: {
                        appearanceMode = .dark
                        colorScheme = .dark
                    }, label: {
                        DarkLightButton(currentMode: $appearanceMode, viewModel: viewModel, mode: .dark, name: "Dark", color: "Dark")
                    })
                    
                    Button(action: {
                        appearanceMode = .system
                        colorScheme = nil
                    }, label: {
                        ZStack {
                            DarkLightButton(currentMode: $appearanceMode, viewModel: viewModel, mode: .system, name: "System", color: "Light")
                            DarkLightButton(currentMode: $appearanceMode, viewModel: viewModel, mode: .system, name: "System", color: "Dark")
                                .mask {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 50, height: 200)
                                        .offset(x: -24)
                                }
                        }
                    })
                }
            }
        }
    }

}

struct DarkLightButton: View {
    @Binding var currentMode: AppearanceMode
    @ObservedObject var viewModel: ViewModel
    var mode: AppearanceMode
    var name: String
    var color: String
    var body: some View {
        VStack {
            VStack {
                Circle()
                    .frame(width: 20, height: 20)
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 49, height: 6)
                
                VStack(spacing: 5) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 38, height: 6)
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 38, height: 6)
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 49, height: 6)
                }
                .frame(width: 55, height: 50)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.white)
                }
            }
            .foregroundColor(Color(UIColor.lightGray).opacity(0.4))
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(color == "Dark" ? .black : .gray.opacity(0.3))
                    .frame(width: 70, height: 110)
            }
            .padding()
            .overlay {
                if currentMode == mode {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(viewModel.colorGroup.color), lineWidth: 1.0)
                }
            }
            
            Text(name)
                .foregroundColor(Color(viewModel.colorGroup.color))
                .font(Font.custom(mode == currentMode ? "Fustat-Bold" : "Fustat-Light", size: 18))
        }
    }
}


struct DarkLightMode_Previews: PreviewProvider {
    @StateObject static var viewModel = ViewModel()

    static var previews: some View {
        DarkLightMode(appearanceMode: .constant(.light), showingSheet: .constant(true), colorScheme: .constant(.light), viewModel: viewModel)
    }
}
