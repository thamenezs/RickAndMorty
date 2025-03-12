//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Thais Souza on 10/03/25.
//

import Foundation


/// Object that represents a single API Call
final class RMRequest {
    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint: RMEndpoint
    
    private let pathComponents: [String]
    
    private let queryParams: [URLQueryItem]
    
    
    /// Constructed url for the api call in string format
    private var urlString: String {
        var string = Constants.baseURL + "/" + endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParams.isEmpty {
            string += "?"
            let argumentString = queryParams.compactMap({
                guard let value = $0.value else {
                    return nil
                }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentString
            
        }
        
        return string
    }
    
    
    /// Computed & constructed api url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    
    /// Construct rquest
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collection of path component
    ///   - queryParams: Collection of query arguments
    public init(endpoint: RMEndpoint,
                pathComponents: [String] = [],
                queryParams: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParams = queryParams
    }
}

