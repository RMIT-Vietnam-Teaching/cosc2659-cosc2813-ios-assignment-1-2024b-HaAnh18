//
//  Product.swift
//  PersonalColor
//
//  Created by Nana on 21/7/24.
//
/*
  RMIT University Vietnam
  Course: COSC2659|COSC2813 iOS Development
  Semester: 2024B
  Assessment: Assignment 1
  Author: Nguyen Tran Ha Anh
  ID: s3938490
  Created date: 21/07/2024
  Last modified: 02/08/2024
  Acknowledgement: Acknowledge the resources that you use here.
*/

import Foundation
import CoreLocation

struct Product: Identifiable, Codable {
    var id: Int
    var images: [String]
    var name: String
    var reviewStar: Double
    var brand: String
    var category: String
    var personalColor: String
    var offlineStore: Bool
    var address: String
    var description: String
    var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    var shopee: SocialLink
    var lazada: SocialLink
    var facebook: SocialLink
    var instagram: SocialLink
    var video: String
}

struct SocialLink: Codable {
    var name: String
    var url: String
}

struct Coordinates: Codable {
    var latitude: Double
    var longitude: Double
}
