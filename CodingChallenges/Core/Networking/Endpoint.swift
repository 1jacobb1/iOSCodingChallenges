//
//  Endpoint.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import Foundation

enum HTTPMethod {
    case post, get, put, delete, patch

    var rawValue: String {
        switch self {
        case .post:
            return "POST"
        case .get:
            return "GET"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        case .patch:
            return "PATCH"
        }
    }
}

enum RequestAuthorization {
    case publicEndpoint, authenticated
}

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var body: Encodable? { get }
    var queryItems: [URLQueryItem]? { get }
    var requestAuthorization: RequestAuthorization { get }
}

extension Endpoint {
    var headers: [String: String]? {
        nil
    }

    var body: Encodable? {
        nil
    }

    var queryItems: [URLQueryItem]? {
        nil
    }

    var requestAuthorization: RequestAuthorization {
        .authenticated
    }
}
