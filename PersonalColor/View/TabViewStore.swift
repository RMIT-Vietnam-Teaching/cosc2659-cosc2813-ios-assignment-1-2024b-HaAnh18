//
//  TabView.swift
//  PersonalColor
//
//  Created by Nana on 20/7/24.
//

import SwiftUI
import MapKit

struct TabViewStore: View {
    @State var currentTab: Int = 0
    @ObservedObject var viewModel: CurrentPersonalColor

    var product: Product
    
    var body: some View {
        ZStack(alignment: .top) {
            TabView(selection: self.$currentTab) {
                MapView(viewModel: viewModel, product: product).tag(0)
                OnlineStore(product: product).tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            
            TabBarView(viewModel: viewModel, currentTab: self.$currentTab)
        }
        .frame(height: 450)
    }
}

struct TabBarView: View {
    @ObservedObject var viewModel: CurrentPersonalColor
    @Binding var currentTab: Int
    @Namespace var namespace
    var tabBarOptions: [String] = ["Offline Store", "Online Store"]
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(Array(zip(self.tabBarOptions.indices, self.tabBarOptions)), id: \.0, content: { index, name in
                TabBarItems(viewModel: viewModel, currentTab: self.$currentTab, namespace: namespace.self, tabBarItemName: name, tab: index)
            })
        }
        .frame(height: 80)
    }
}

struct TabBarItems: View {
    @ObservedObject var viewModel: CurrentPersonalColor
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
                    .font(Font.custom("Fustat-Light", size: 18))
                    .foregroundColor(currentTab == tab ? Color(viewModel.colorGroup.color) : .black)

                if currentTab == tab {
                    Color(currentTab == tab ? Color(viewModel.colorGroup.color) : .black)
                        .frame(height: 1)
                        .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
                } else {
                    Color.clear
                        .frame(height: 1)
                }
            }
            .frame(width: 150)
            .animation(.spring(), value: self.currentTab)
        })
    }
}

#Preview {
//    TabViewStore()
//    Detail()
    Test()
}
