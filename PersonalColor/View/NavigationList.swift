//
//  NavigationList.swift
//  PersonalColor
//
//  Created by Nana on 16/7/24.
//

import SwiftUI

struct NavigationList: View {
    @State var colorGroup: PersonalColor? = personalColor[2]
    @State private var searchText:String = ""
    @State private var filter: String = ""
    @State private var isFilter: Bool = false

    var body: some View {
        ZStack {
            Color(colorGroup!.backgroundColor)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    NavigationBar()
                    
                    Carousel(activeColor: $colorGroup)
//                        .background(.white)
                    
                    Text(colorGroup!.name)
                        .font(Font.custom("DancingScript-Bold", size: 60))
                        .foregroundColor(Color(colorGroup!.color))
//                        .background(.white)
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 12) {
                            Button(action: {
                                isFilter = isFilter == false ? true : false
                            }, label: {
                                Image(systemName: "line.3.horizontal")
                                    .font(.title)
                                    .foregroundColor(Color(colorGroup!.color))
                                
                            })
                            
                            HStack(spacing: 12) {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color(colorGroup!.color))
                                
                                TextField("Search", text: $searchText)
                                    .foregroundColor(Color(colorGroup!.color))
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .background(
                                        Capsule()
                                            .strokeBorder(Color(colorGroup!.color),lineWidth: 0.8)
//                                            .background(Color.blue)
                                        )

                        }
                        .padding(.horizontal, 20)
                        
                        if isFilter {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .frame(width: 150, height: 200)
                                    .foregroundColor(Color(colorGroup!.backgroundColor))
                                    .shadow(color: Color(colorGroup!.color).opacity(0.3) ,radius: 2)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 0)
                            }
                        }
                    }
                    
                    CardList()
                
                        
                    }
                
                
                }
            }
        }
}

#Preview {
    NavigationList()
}
