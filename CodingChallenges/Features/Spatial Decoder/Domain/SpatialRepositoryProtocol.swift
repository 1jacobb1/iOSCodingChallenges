//
//  SpatialRepositoryProtocol.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

protocol SpatialRepositoryProtocol {
    func execute() async throws -> [String]
}
