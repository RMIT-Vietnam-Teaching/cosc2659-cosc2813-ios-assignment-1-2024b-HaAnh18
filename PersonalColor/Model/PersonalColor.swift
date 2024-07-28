//
//  PersonalColor.swift
//  PersonalColor
//
//  Created by Nana on 16/7/24.
//
/*
  RMIT University Vietnam
  Course: COSC2659|COSC2813 iOS Development
  Semester: 2024B
  Assessment: Assignment 1
  Author: Nguyen Tran Ha Anh
  ID: s3938490
  Created date: 16/07/2024
  Last modified: 02/08/2024
  Acknowledgement: Acknowledge the resources that you use here.
*/

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
