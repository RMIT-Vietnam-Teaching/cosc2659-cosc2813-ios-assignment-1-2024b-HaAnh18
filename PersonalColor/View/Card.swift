//
//  Card.swift
//  PersonalColor
//
//  Created by Nana on 17/7/24.
//

import SwiftUI

struct Card: View {
    @ObservedObject var viewModel: ViewModel

    var product: Product
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(.white)
//                        .stroke(lineWidth: 1.0)
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
                    .font(Font.custom("PTSerif-Bold", size: 18))
                    .frame(width: 170, alignment: .top)
                    .foregroundColor(Color("black"))
                    .padding(.horizontal, -20)

                
                Text(product.brand)
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
