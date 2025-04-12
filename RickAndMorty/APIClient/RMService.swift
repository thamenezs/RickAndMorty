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
    
    enum RMServiceError: Error {
        case failedCreateRequest
    }
    
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
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedCreateRequest))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        
        task.resume()
        
    }
    
    // MARK: - Private
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        
        return request
    }
}
