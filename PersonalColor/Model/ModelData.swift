//
//  ModelData.swift
//  PersonalColor
//
//  Created by Nana on 16/7/24.
//

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



var personalColor: [PersonalColor] = decodeJsonFromJsonFile(jsonFileName: "personalColor.json", model: PersonalColor.self)
