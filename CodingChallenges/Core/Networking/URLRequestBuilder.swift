//
//  URLRequestBuilder.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import Foundation

struct URLRequestBuilder {
    func makeURLRequest(endpoint: Endpoint) throws -> URLRequest {
        var urlComponents = URLComponents(
            url: endpoint.baseURL.appendingPathComponent(endpoint.path),
            resolvingAgainstBaseURL: false
        )

        // url query
        urlComponents?.percentEncodedQueryItems = endpoint.queryItems

        guard let url = urlComponents?.url else {
            throw NSError(domain: "Invalid URL", code: 1)
        }

        var request = URLRequest(url: url)

        // http method
        request.httpMethod = endpoint.method.rawValue

        // request headers
        if let headers = endpoint.headers {
            headers.forEach {
                request.setValue($0.key, forHTTPHeaderField: $0.key)
            }
        }

        // body
        if let body = endpoint.body {
            do {
                request.httpBody = try JSONEncoder().encode(body)
            } catch {
                throw error
            }
        }

        return request
    }
}
