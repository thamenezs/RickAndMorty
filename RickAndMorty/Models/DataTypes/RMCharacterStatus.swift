//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Thais Souza on 11/03/25.
//

import Foundation


enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unkwnown` = "unknown"
    
    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unkwnown:
            return "Unknown"
        }
    }
}
