//
//  Location.swift
//  RickAndMorty
//
//  Created by Thais Souza on 10/03/25.
//

import Foundation


struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
    
}
