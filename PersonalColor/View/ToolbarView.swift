//
//  ToolbarView.swift
//  PersonalColor
//
//  Created by Nana on 22/7/24.
//

import SwiftUI

struct ToolbarView: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @Binding var isDarkMode: Bool
    var product: Product
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            HStack(spacing: 0) {
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.backward")
                        .font(.title)
                        .foregroundColor(Color("black"))
                })
                .frame(width: width / 3 - 50)
//                .background(.yellow)
                
                Text(product.name)
//                    .font(Font.custom("DancingScript-Bold", size: 40))
//                    .font(Font.custom("BodoniModaSC_48pt-Medium", size: 40))
                    .font(Font.custom("PlayfairDisplay-Bold", size: 20))
//                    .textCase(.uppercase)
//                    .background(.pink)
                    .frame(width: width / 3 + 100)
                
                HStack {
                    Image(systemName: viewModel.contains(product) ? "heart.fill" : "heart")
                        .font(.title)
                        .foregroundColor(Color("black"))
                        .onTapGesture {
                            viewModel.toggleFav(product: product)
                        }
                    
                    Image(systemName: isDarkMode ? "sun.max" : "moon")
                        .font(.title)
                        .foregroundColor(Color("black"))
                        .onTapGesture {
                            isDarkMode.toggle()
                        }
                    
                }
                .frame(width: width / 3 - 50)
//                .background(.blue)
            }
//            .background(.blue)
//            .background(Color(viewModel.colorGroup.backgroundColor))
            .frame(width: width)
        }
        .frame(height: 45)
        .background(Color(viewModel.colorGroup.backgroundColor))

    }
}

//#Preview {
////    ToolbarView()
////    Test()
//    WelcomeView()
//}

struct ToolbarView_Previews: PreviewProvider {
    @StateObject static var viewModel = ViewModel()

    static var previews: some View {
        ToolbarView(viewModel: viewModel, isDarkMode: .constant(false), product: products[0])
    }
}
