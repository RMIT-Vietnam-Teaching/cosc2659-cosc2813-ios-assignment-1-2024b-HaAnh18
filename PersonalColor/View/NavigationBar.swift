//
//  NavigationBar.swift
//  PersonalColor
//
//  Created by Nana on 16/7/24.
//
/*
  RMIT University Vietnam
  Course: COSC2659|COSC2813 iOS Development
  Semester: 2024B
  Assessment: Assignment 1
  Author: Nguyen Tran Ha Anh
  ID: s3938490
  Created date: 16/07/2024
  Last modified: 02/08/2024
  Acknowledgement: Acknowledge the resources that you use here.
    https://stackoverflow.com/questions/74527314/swiftui-how-to-remove-back-button-from-navigationlink-on-next-page
    https://www.hackingwithswift.com/quick-start/swiftui/how-to-present-a-new-view-using-sheets
*/

import SwiftUI

struct NavigationBar: View {
    @State private var showingSheet = false
    @ObservedObject var viewModel: ViewModel
//    @Binding var isDarkMode: Bool
    @Binding var colorScheme: ColorScheme?
    @Binding var appearanceMode: AppearanceMode

    @Environment(\.dismiss) var dismiss


    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            HStack(spacing: 0) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "house")
                        .font(.title)
                        .foregroundColor(Color("black"))
                    
                })
                .frame(width: width / 3 - 30)
                Text("Aoife")
                    .font(Font.custom("PlayfairDisplay-Bold", size: 40))
                    .frame(width: width / 3 + 60)
                
                HStack {
                    Button(action: {
                        viewModel.sortFavs()
                    }, label: {
                        Image(systemName: viewModel.showingFavs ? "heart.fill" : "heart")
                            .font(.title)
                            .foregroundColor(Color("black"))
                        
                    })
                    
                    Button(action: {
                        showingSheet.toggle()
                    }, label: {
                        Image(systemName: colorScheme == .light ? "sun.max"  : colorScheme == .dark ? "moon" : "gearshape")
                            .font(.title)
                            .foregroundColor(Color("black"))
        
                    })
                    .sheet(isPresented: $showingSheet) {
                        DarkLightMode(appearanceMode: $appearanceMode, showingSheet: $showingSheet, colorScheme: $colorScheme, viewModel: viewModel)
                            .presentationDetents([.large, .medium, .fraction(0.35)])
                    }
                }
                .frame(width: width / 3 - 30)
            }
            .frame(width: width)
            
        }
        
    }
    
}

struct NavigationBar_Previews: PreviewProvider {
    @StateObject static var viewModel = ViewModel()

    static var previews: some View {
        NavigationBar(viewModel: viewModel, colorScheme: .constant(.light), appearanceMode: .constant(.light))
    }
}
