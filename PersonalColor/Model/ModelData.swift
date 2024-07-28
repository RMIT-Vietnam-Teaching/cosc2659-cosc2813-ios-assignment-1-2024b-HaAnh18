//
//  ModelData.swift
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

func decodeJsonFromJsonFile<T: Decodable>(jsonFileName: String, model: T.Type) -> [T] {
    
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil){
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([T].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else  {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [ ] as [T]
}



var personalColors: [PersonalColor] = decodeJsonFromJsonFile(jsonFileName: "personalColor.json", model: PersonalColor.self)
var products: [Product] = decodeJsonFromJsonFile(jsonFileName: "products.json", model: Product.self)
