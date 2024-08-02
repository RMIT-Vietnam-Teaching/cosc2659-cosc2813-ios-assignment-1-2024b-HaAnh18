//
//  Card.swift
//  PersonalColor
//
//  Created by Nana on 17/7/24.
//
/*
  RMIT University Vietnam
  Course: COSC2659|COSC2813 iOS Development
  Semester: 2024B
  Assessment: Assignment 1
  Author: Nguyen Tran Ha Anh
  ID: s3938490
  Created date: 17/07/2024
  Last modified: 02/08/2024
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI

struct Card: View {
    @ObservedObject var viewModel: ViewModel

    var product: Product
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(.white)
                    .frame(width: 150, height: 150)
                
                Image(product.images[0])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                
                Image(systemName: viewModel.contains(product) ? "heart.fill" : "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .font(.title)
                    .foregroundColor(.red)
                    .offset(x: 50, y: -50)
                    .onTapGesture {
                        viewModel.toggleFav(product: product)
                    }
            }
            
            VStack {
                Text(product.name)
                    .font(Font.custom("PlayfairDisplay-Bold", size: 18))
                    .frame(width: 170, alignment: .top)
                    .foregroundColor(Color("black"))
//                    .padding(.horizontal, -20)
                
                Text(product.brand)
                    .font(Font.custom("Fustat-Light", size: 18))
                    .frame(width: 150, alignment: .top)
                    .foregroundColor(Color("black"))
                    
            }
        }
    }
}

struct Card_Previews: PreviewProvider {
    @StateObject static var viewModel = ViewModel()

    static var previews: some View {
        Card(viewModel: viewModel, product: products[0])
    }
}
