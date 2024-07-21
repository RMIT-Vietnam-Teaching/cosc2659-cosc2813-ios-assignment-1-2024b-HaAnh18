//
//  MapView.swift
//  PersonalColor
//
//  Created by Nana on 18/7/24.
//

import Foundation
import MapKit
import SwiftUI

struct MapView: View {
    @ObservedObject var viewModel: CurrentPersonalColor

//    var coordinate: CLLocationCoordinate2D
    var product: Product
    
    @State private var region = MKCoordinateRegion()
    
    @State private var cameraPosition: MapCameraPosition = .automatic
    @State private var seeDetail: Bool = false

    var body: some View {
//        Map(coordinateRegion: $region, annotationItems: contacts,
//            annotationContent: { location in
//            MapAnnotation(coordinate: coordinate, content: {
//                Text("pin")
//            })
//        }
//        )
//
//            .onAppear {
//                setRegion(_coordinate: coordinate)
//            }
        
//
        VStack {
            HStack {
                Text("\(product.brand) Store: ")
                    .font(Font.custom("Fustat-Bold", size: 18))
                    .frame(width: 300, alignment: .leading)
                
                Spacer()
            }


            HStack {
                Text("702 Nguyen Van Linh Street")
                    .font(Font.custom("Fustat-Light", size: 18))
                    .frame(width: 300, alignment: .leading)
                
                Spacer()
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
                            Text(product.address)
                                .font(Font.custom("Fustat-Light", size: 10))
                                .background {
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 100)
                                }
                                .offset(x: 70, y: 35)
                                .frame(width: 100, alignment: .top)
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
        }
        
        .padding(.horizontal, 20)
        .padding(.top, 70)
//        .background(.pink)
        .frame(height: 500)

    }
        private func setRegion(_coordinate: CLLocationCoordinate2D) {
            region = MKCoordinateRegion(
                center: product.locationCoordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006)
            )
        }
    
}

#Preview {
//    MapView(coordinate: CLLocationCoordinate2DMake(10.7294109651741866, 106.69522548892152))
//    TabViewStore()
    Test()
}
