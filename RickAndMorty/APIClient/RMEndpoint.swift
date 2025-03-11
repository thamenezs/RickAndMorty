//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Thais Souza on 10/03/25.
//

import Foundation

/// Represents unique api endpoint
/// Frozen means the enum wont recieve any other value
@frozen enum RMEndpoint: String {
    case character
    case location
    case episode
}
