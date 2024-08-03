//
//  OnlineStore.swift
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
 */

import SwiftUI

struct OnlineStore: View {
    var product: Product
    
    var body: some View {

        VStack {
            HStack {
                Text("Visit us at: ")
                    .font(Font.custom("Fustat-Bold", size: 18))
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .frame(height: 40)
            
            // Shopee link
            if let url = URL(string: product.shopee.url) { // Check if the URL is valid
                if url.scheme == "http" || url.scheme == "https" { // Check if the URL scheme is http or https
                    Link(destination: url) {
                        HStack(spacing: 10) {
                            Image("shopee")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                            
                            Text(product.shopee.name)
                                .font(Font.custom("Fustat-Light", size: 18))
                                .foregroundColor(Color("black-custom"))
                            
                            Spacer()
                        }
                        .padding(.horizontal, 40)
                    }
                }
            }
            
            // Lazada link
            if let url = URL(string: product.lazada.url) { // Check if the URL is valid
                if url.scheme == "http" || url.scheme == "https" { // Check if the URL scheme is http or https
                    Link(destination: url) {
                        HStack(spacing: 10) {
                            Image("lazada")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                            
                            Text(product.lazada.name)
                                .font(Font.custom("Fustat-Light", size: 18))
                                .foregroundColor(Color("black-custom"))
                            
                            Spacer()

                        }
                        .padding(.horizontal, 40)
                    }
                }
            }
            
            // Facebook link
            if let url = URL(string: product.facebook.url) { // Check if the URL is valid
                if url.scheme == "http" || url.scheme == "https" { // Check if the URL scheme is http or https
                    Link(destination: url) {
                        HStack(spacing: 10) {
                            Image("facebook")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                            
                            Text(product.facebook.name)
                                .font(Font.custom("Fustat-Light", size: 18))
                                .foregroundColor(Color("black-custom"))
                            
                            Spacer()

                        }
                        .padding(.horizontal, 40)
                    }
                }
            }
            
            // Instagram link
            if let url = URL(string: product.instagram.url) { // Check if the URL is valid
                if url.scheme == "http" || url.scheme == "https" { // Check if the URL scheme is http or https
                    Link(destination: url) {
                        HStack(spacing: 10) {
                            Image("instagram")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                            
                            Text(product.instagram.name)
                                .font(Font.custom("Fustat-Light", size: 18))
                                .foregroundColor(Color("black-custom"))
                            
                            Spacer()

                        }
                        .padding(.horizontal, 40)
                    }
                }
            }
            Spacer()
            
        }
        .padding(.top, 120)
        .frame(height: 600)
    }
}

#Preview {
    OnlineStore(product: products[0])
}



