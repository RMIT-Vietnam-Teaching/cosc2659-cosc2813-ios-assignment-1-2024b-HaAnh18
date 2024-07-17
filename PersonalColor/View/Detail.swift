//
//  Detail.swift
//  PersonalColor
//
//  Created by Nana on 17/7/24.
//

import SwiftUI

struct Detail: View {
    var body: some View {
        ZStack {
            Color("spring-bg")
                .ignoresSafeArea()
            
            VStack {
                Image("test-product")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
//                    .background(.white)
                
                Text("Berry Fuchsia Garden")
                    .font(Font.custom("PTSerif-Bold", size: 30))
//                    .frame(width: 150, alignment: .leading)
                    .frame(width: 350, alignment: .leading)
//                    .background(.white)
                
            
                
//                    Text("Romand")
//                        .frame(width: 300, alignment: .leading)
                
//                .frame(width: 300, alignment: .leading)
//                    .frame(width: 150, alignment: .leading)

            }
            
        }
    }
}

#Preview {
    Detail()
}
