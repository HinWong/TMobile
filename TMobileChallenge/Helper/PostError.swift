//
//  PostError.swift
//  TMobileChallenge
//
//  Created by Hin Wong on 5/20/21.
//

import Foundation

enum PostError: LocalizedError {
    case thrown(Error)
    case invalidURL
    case noData
    case badData
    case unableToDelete
    
    var errorDescription: String? {
        switch self {
            
        case .thrown(let error):
            return error.localizedDescription
        case .invalidURL:
            return "Unable to reach server."
        case .noData:
            return "Server responded with no data."
        case .badData:
            return "Server responded with bad data."
        case .unableToDelete:
            return "Unable to delete."
        }
    }
}
