//
//  Background.swift
//  PersonalColor
//
//  Created by Nana on 16/7/24.
//

import SwiftUI
import _MapKit_SwiftUI

struct Background: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    @State private var cameraPosition: MapCameraPosition = .automatic
    @State private var seeDetail: Bool = true
    
    var body: some View {
        ZStack {
            Map(position: $cameraPosition) {
                Annotation("Romand Store", coordinate: coordinate, content: {
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
                                Text("Romand Store")
                                    .font(Font.custom("Fustat-Bold", size: 16))

                                Text("32-1 Myeongdong 8-gil, Jung District, Seoul, South Korea")
                                    .font(Font.custom("Fustat-Light", size: 14))
                            }
                                .font(Font.custom("Fustat-Light", size: 10))
                                .foregroundColor(Color("white"))
                                .background {
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundColor(Color("spring").opacity(0.8))
                                        .frame(width: 200, height: 70)
                                }
                                .offset(x: -40, y: -55)
                                .frame(width: 200, alignment: .top)
                        }
                    }
                })
            }
                .onAppear{
                    setRegion(_coordinate: coordinate)
                    cameraPosition = .region(region)
                }
                .frame(width: 300, height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
            
//            Spacer()
        }
//        }
        
    }
    private func setRegion(_coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006)
        )
    }
}

#Preview {
    Background(coordinate: CLLocationCoordinate2DMake(10.7294109651741866, 106.69522548892152))
}
