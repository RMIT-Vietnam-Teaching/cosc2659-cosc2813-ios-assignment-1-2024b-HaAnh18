//
//  Card.swift
//  PersonalColor
//
//  Created by Nana on 17/7/24.
//

import SwiftUI

struct Card: View {
    var body: some View {
        
//        ZStack {
//            Color("spring-bg")
//                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundColor(.white)
                        .frame(width: 150, height: 150)
                    
                    Image("test-product")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                    
                    Button(action: {
                    }, label: {
                        Image(systemName: "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .font(.title)
                            .foregroundColor(.red)
                            
                        
                    })
                    .offset(x: 50, y: -50)
                    
                }
                
                VStack {
                    Text("Berry Fuchsia Garden")
                        .font(Font.custom("PTSerif-Bold", size: 18))
                        .frame(width: 150, alignment: .leading)
                    
                    Text("Romand")
                        .frame(width: 150, alignment: .leading)

                        
//                }
                
                
                
                
            }
            
//            .background(.pink)
            
            
        }
    }
}

#Preview {
    Card()
}
