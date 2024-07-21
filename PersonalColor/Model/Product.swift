//
//  Product.swift
//  PersonalColor
//
//  Created by Nana on 21/7/24.
//

import Foundation
import CoreLocation

struct Product: Identifiable, Codable {
    var id: Int
    var images: [String]
    var favourite: Bool
    var name: String
    var reviewStar: Double
    var brand: String
    var category: String
    var personalColor: String
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
}

struct SocialLink: Codable {
    var name: String
    var url: String
}

struct Coordinates: Codable {
    var latitude: Double
    var longitude: Double
}
