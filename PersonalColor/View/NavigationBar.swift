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
    @Binding var colorScheme: ColorScheme?
    @Binding var appearanceMode: AppearanceMode

    @Environment(\.dismiss) var dismiss


    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width // Get the width of the geometry
            HStack {
                Button(action: {
                    dismiss() // Action to dismiss the current view
                }, label: {
                    Image(systemName: "house")
                        .font(.title)
                        .foregroundColor(Color("black-custom"))
                    
                })
                .frame(width: width / 3 - 30) // Set the button width to one-third of the screen width minus 30 
                
                Text("Aoife")
                    .font(Font.custom("PlayfairDisplay-Bold", size: 40))
                    .frame(width: width / 3 + 60)
                
                HStack {
                    Button(action: {
                        viewModel.sortFavs() // Action to sort favorites
                    }, label: {
                        Image(systemName: viewModel.showingFavs ? "heart.fill" : "heart") // Heart icon, filled if showingFavs is true
                            .font(.title)
                            .foregroundColor(Color("black-custom"))
                    })
                    
                    Button(action: {
                        showingSheet.toggle() // Toggle the sheet presentation
                    }, label: {
                        Image(systemName: colorScheme == .light ? "sun.max"  : colorScheme == .dark ? "moon" : "gearshape")
                            .font(.title)
                            .foregroundColor(Color("black-custom"))
                    })
                    .sheet(isPresented: $showingSheet) {
                        DarkLightMode(appearanceMode: $appearanceMode, showingSheet: $showingSheet, colorScheme: $colorScheme, viewModel: viewModel)
                            .presentationDetents([.large, .medium, .fraction(0.35)]) // Set the sheet presentation sizes
                    }
                    Spacer()
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
