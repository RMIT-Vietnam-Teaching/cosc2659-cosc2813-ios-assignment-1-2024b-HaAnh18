//
//  TabView.swift
//  PersonalColor
//
//  Created by Nana on 20/7/24.
//
/*
  RMIT University Vietnam
  Course: COSC2659|COSC2813 iOS Development
  Semester: 2024B
  Assessment: Assignment 1
  Author: Nguyen Tran Ha Anh
  ID: s3938490
  Created date: 20/07/2024
  Last modified: 02/08/2024
  Acknowledgement: Acknowledge the resources that you use here.
    https://www.youtube.com/watch?v=RPCTAv_e2kA
 */

import SwiftUI
import MapKit

struct TabViewStore: View {
    @State var currentTab: Int = 0
    @ObservedObject var viewModel: ViewModel

    var product: Product
    
    var body: some View {
        ZStack(alignment: .top) {
            TabView(selection: self.$currentTab) {
                MapView(viewModel: viewModel, product: product).tag(0)
                OnlineStore(product: product).tag(1)
//                VideoDemo().tag(2)
                VideoView(product: product).tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            TabBarView(viewModel: viewModel, currentTab: self.$currentTab)
        }
        .frame(height: 500)
    }
}

struct TabBarView: View {
    @ObservedObject var viewModel: ViewModel
    @Binding var currentTab: Int
    @Namespace var namespace
    var tabBarOptions: [String] = ["Offline Store", "Online Store", "Swatch Video"]
    
    var body: some View {
        HStack(spacing: 5) {
            ForEach(Array(zip(self.tabBarOptions.indices, self.tabBarOptions)), id: \.0, content: { index, name in
                TabBarItems(viewModel: viewModel, currentTab: self.$currentTab, namespace: namespace.self, tabBarItemName: name, tab: index)
            })
        }
        .frame(height: 80)
        .padding(.horizontal, 15)
    }
}

struct TabBarItems: View {
    @ObservedObject var viewModel: ViewModel
    @Binding var currentTab: Int
    let namespace: Namespace.ID
    var tabBarItemName: String
    var tab: Int
    
    var body: some View {
        Button(action: {
            self.currentTab = tab
        }, label: {
            VStack {
                Text(tabBarItemName)
                    .font(Font.custom(currentTab == tab ? "Fustat-Bold" : "Fustat-Light", size: 18))
                    .foregroundColor(currentTab == tab ? Color(viewModel.colorGroup.color) : Color("black-custom"))

                if currentTab == tab {
                    Color(currentTab == tab ? Color(viewModel.colorGroup.color) : Color("black-custom"))
                        .frame(height: 1)
                        .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
                } else {
                    Color.clear
                        .frame(height: 1)
                }
            }
            .animation(.spring(), value: self.currentTab)
        })
    }
}

struct TabViewStore_Previews: PreviewProvider {
    @StateObject static var viewModel = ViewModel()

    static var previews: some View {
        TabViewStore(viewModel: viewModel, product: products[0])
    }
}
