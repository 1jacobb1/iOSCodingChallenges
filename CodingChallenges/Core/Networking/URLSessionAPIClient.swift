//
//  URLSessionAPIClient.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import Foundation

final class URLSessionAPIClient: APIClient {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func request<T>(endpoint: Endpoint) async throws -> T where T : Decodable {
        do {
            let urlRequest = try URLRequestBuilder().makeURLRequest(endpoint: endpoint)
            let (data, response) = try await session.data(for: urlRequest)
            try validate(urlResponse: response)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw error
        }
    }

    func request(endpoint: Endpoint) async throws -> String {
        do {
            let urlRequest = try URLRequestBuilder().makeURLRequest(endpoint: endpoint)
            let (data, response) = try await session.data(for: urlRequest)
            try validate(urlResponse: response)
            return String(data: data, encoding: .utf8) ?? ""
        } catch {
            throw error
        }
    }

    private func validate(urlResponse: URLResponse) throws {
        guard let httpResponse = urlResponse as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        switch httpResponse.statusCode {
        case 200...299:
            break
        case 401:
            throw NetworkError.unauthorized
        case 403:
            throw NetworkError.forbidden
        default:
            throw NetworkError.unknownStatusCode(code: httpResponse.statusCode)
        }
    }
}
