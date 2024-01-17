//
//  DessertDetails.swift
//  Desserts
//
//  Created by Jonathan Paul on 1/8/24.
//

import Foundation

struct DessertDetails: Hashable {
    // 1-1 relationship between ingredients and measures
    struct Ingredient: Codable, Identifiable, Hashable {
        init(name: String, measure: String, id: UUID = UUID()) {
            self.id = id
            self.name = name
            self.measure = measure
        }
        let id: UUID
        let name: String
        let measure: String
    }
    let id: String
    let name: String
    let instructions: [String]
    let ingredients: [Ingredient]
}
