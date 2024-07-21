//
//  PersonalColor.swift
//  PersonalColor
//
//  Created by Nana on 16/7/24.
//

import Foundation
import SwiftUI

struct PersonalColor: Identifiable, Codable, Equatable {
    var id: Int
    var name: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    var color: String
    var description: String
    var backgroundColor: String
}
