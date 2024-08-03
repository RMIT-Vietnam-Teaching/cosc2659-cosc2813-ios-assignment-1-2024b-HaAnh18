//
//  MapView.swift
//  PersonalColor
//
//  Created by Nana on 18/7/24.
//
/*
  RMIT University Vietnam
  Course: COSC2659|COSC2813 iOS Development
  Semester: 2024B
  Assessment: Assignment 1
  Author: Nguyen Tran Ha Anh
  ID: s3938490
  Created date: 18/07/2024
  Last modified: 02/08/2024
  Acknowledgement: Acknowledge the resources that you use here.
 */

import Foundation
import MapKit
import SwiftUI

struct MapView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var region = MKCoordinateRegion()
    @State private var cameraPosition: MapCameraPosition = .automatic
    @State private var seeDetail: Bool = false
    
    var product: Product

    var body: some View {
        VStack(spacing: 15){
            VStack {
                HStack {
                    Text("\(product.brand) Store: ")
                        .font(Font.custom("Fustat-Bold", size: 18))
                    
                    Spacer()
                }
                
                HStack {
                    Text(product.address)
                        .font(Font.custom("Fustat-Light", size: 18))
                        .frame(width: 350, alignment: .leading)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                
            }
            
            Map(position: $cameraPosition) {
                Annotation("\(product.brand) Store", coordinate: product.locationCoordinate, content: {
                    ZStack {
                        Button(action: {
                            seeDetail = seeDetail == false ? true : false
                        }, label: {
                            Image(systemName: "mappin.and.ellipse")
                                .imageScale(.large)
                                .foregroundColor(.red)
                                .frame(width: 100)
                        })
                        
                        if seeDetail {
                            VStack {
                                Text("\(product.brand) Store")
                                    .font(Font.custom("Fustat-Bold", size: 16))
                                
                                Text(product.address)
                                    .font(Font.custom("Fustat-Light", size: 14))
                            }
                            .font(Font.custom("Fustat-Light", size: 10))
                            .foregroundColor(Color("white-custom"))
                            .background {
                                RoundedRectangle(cornerRadius: 10.0)
                                    .foregroundColor(Color(viewModel.colorGroup.color).opacity(0.8))
                                    .frame(width: 220)
                            }
                            .offset(x: -40, y: -55)
                            .frame(width: 200, alignment: .top)
                        }
                    }
                })
            }
            .onAppear{
                setRegion(_coordinate: product.locationCoordinate)
                cameraPosition = .region(region)
            }
            .frame(width: 300, height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 120)
        .frame(height: 600)
    }
        private func setRegion(_coordinate: CLLocationCoordinate2D) {
            region = MKCoordinateRegion(
                center: product.locationCoordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006)
            )
        }
}

struct MapView_Previews: PreviewProvider {
    @StateObject static var viewModel = ViewModel()

    static var previews: some View {
        TabViewStore(viewModel: viewModel, product: products[0])

//        MapView(viewModel: viewModel, product: products[0])
    }
}


