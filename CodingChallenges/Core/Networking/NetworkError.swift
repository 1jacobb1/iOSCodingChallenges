//
//  NetworkError.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidResponse
    case decodingError(description: String)
    case unauthorized
    case forbidden
    case unknownStatusCode(code: Int)

    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid Response"
        case .decodingError(let description):
            return "Decoding Error, See details: \(description)"
        case .unauthorized:
            return "Unauthorized"
        case .forbidden:
            return "Accessing this page is forbidden"
        case .unknownStatusCode(let code):
            return "Unknown status code: \(code)"
        }
    }
}
