//
//  OnlineStore.swift
//  PersonalColor
//
//  Created by Nana on 20/7/24.
//

import SwiftUI

struct OnlineStore: View {
    var product: Product
//    let urlString = "https://www.example.com"
    
    var body: some View {

        VStack {
            HStack {
                Text("Visit us at: ")
                    .font(Font.custom("Fustat-Bold", size: 18))
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .frame(height: 40)
            
            
            if let url = URL(string: product.shopee.url) {
                if url.scheme == "http" || url.scheme == "https" {
                    Link(destination: url) {
                        HStack(spacing: 10) {
                            Image("shopee")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                            
                            Text(product.shopee.name)
                                .font(Font.custom("Fustat-Light", size: 18))
                                .foregroundColor(Color("black"))
                            
                            Spacer()
                        }
                        .padding(.horizontal, 40)
                    }
                }
            }
            
            if let url = URL(string: product.lazada.url) {
                if url.scheme == "http" || url.scheme == "https" {
                    Link(destination: url) {
                        HStack(spacing: 10) {
                            Image("lazada")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                            
                            Text(product.lazada.name)
                                .font(Font.custom("Fustat-Light", size: 18))
                                .foregroundColor(Color("black"))
                            
                            Spacer()

                        }
                        .padding(.horizontal, 40)
                    }
                }
            }
            
            if let url = URL(string: product.facebook.url) {
                if url.scheme == "http" || url.scheme == "https" {
                    Link(destination: url) {
                        HStack(spacing: 10) {
                            Image("facebook")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                            
                            Text(product.facebook.name)
                                .font(Font.custom("Fustat-Light", size: 18))
                                .foregroundColor(Color("black"))
                            
                            Spacer()

                        }
                        .padding(.horizontal, 40)
                    }
                }
            }
            
            if let url = URL(string: product.instagram.url) {
                if url.scheme == "http" || url.scheme == "https" {
                    Link(destination: url) {
                        HStack(spacing: 10) {
                            Image("instagram")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                            
                            Text(product.instagram.name)
                                .font(Font.custom("Fustat-Light", size: 18))
                                .foregroundColor(Color("black"))
                            
                            Spacer()

                        }
                        .padding(.horizontal, 40)
                    }
                }
            }
            
            Spacer()
            
        }
        .padding(.top, 80)
        .frame(height: 450)
    }
}

#Preview {
    OnlineStore(product: products[0])
}



