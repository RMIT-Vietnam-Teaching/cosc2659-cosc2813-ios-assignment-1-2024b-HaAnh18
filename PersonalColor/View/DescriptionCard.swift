//
//  DescriptionCard.swift
//  PersonalColor
//
//  Created by Nana on 17/7/24.
//

import SwiftUI

struct DescriptionCard: View {
    @ObservedObject var viewModel: CurrentPersonalColor
    var product: Product
    
    var body: some View {
        VStack(spacing: 10) {
//            Text("Description")
//                .font(Font.custom("PlayfairDisplay-Bold", size: 25))
////                .font(Font.custom("DancingScript-Bold", size: 45))
            Text("Description")
                .font(Font.custom("PlayfairDisplay-Bold", size: 25))
                .padding(.top, 50)
                .foregroundColor(.white)
        
            Text(product.description)
                .padding(.horizontal, 60)
                .padding(.bottom, 60)
                .minimumScaleFactor(0.5)
//                .background(.yellow)
                .foregroundColor(.white)
                .font(Font.custom("Fustat-Light", size: 18))
               
            
//            .frame(width: 400)
        }
        .frame(width: 400)
        .background(content: {
            RoundedRectangle(cornerRadius: 25.0)
//                        .foregroundColor(Color("spring"))
                .stroke(.black, lineWidth: 1.0)
                .rotationEffect(.degrees(10))
                .padding()
                .frame(width: 355)
            
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(Color(viewModel.colorGroup.color).opacity(0.8))
                .padding()
                .frame(width: 350)
            
            RoundedRectangle(cornerRadius: 25.0)
//                        .foregroundColor(Color("spring"))
                .stroke(.black, lineWidth: 1.0)
                .rotationEffect(.degrees(-10))
                .padding()
                .frame(width: 355)
            
            
        })
    }
}

#Preview {
//    DescriptionCard()
    Test()
}
