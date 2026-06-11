//
//  APIClient.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

protocol APIClient {
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T
    func request(endpoint: Endpoint) async throws -> String
}
