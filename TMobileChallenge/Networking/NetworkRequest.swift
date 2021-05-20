//
//  NetworkRequest.swift
//  TMobileChallenge
//
//  Created by Hin Wong on 5/20/21.
//

import UIKit

//http://www.reddit.com/.json

class NetworkRequest {
    
    private static let baseURL = URL(string: "http://www.reddit.com/.json")
    
    //MARK: - Fetching posts
    static func fetchPosts(completion: @escaping (Result<[Post], PostError>) -> Void) {
        
        //1. URL
        guard let baseURL = baseURL else { return completion(.failure(.invalidURL)) }
        print(baseURL)
        
        //2. data task
        URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            
            // 3. error handling
            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
            
            //4. Decode data
            guard let data = data else {return completion(.failure(.noData))}
            do {
                let decoder = JSONDecoder()
                let topLevelObject = try decoder.decode(Reddit.self, from: data)
                let secondLevelObject = topLevelObject.data
                let thirdLevelObject = secondLevelObject.children
                
                print(thirdLevelObject)
                return completion(.success(thirdLevelObject))
                
            } catch {
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
            
        }.resume()
    }
    
}
