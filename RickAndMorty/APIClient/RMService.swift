//
//  RMService.swift
//  RickAndMorty
//
//  Created by Thais Souza on 10/03/25.
//

import Foundation


/// PrimaryAPI service object to get Rick and Morty data
final class RMService {
    
    /// Shrared singleton instance
    static let shared = RMService()
    
    
    
    /// Privatized constructor
    private init () {}
    
    
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: Type of object to give back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        
    }
}
