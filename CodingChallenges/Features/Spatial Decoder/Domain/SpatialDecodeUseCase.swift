//
//  SpatialDecodeUseCase.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

struct SpatialDecodeUseCase {
    let repository: SpatialRepositoryProtocol

    init(repository: SpatialRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async throws -> [String] {
        return try await repository.execute()
    }
}
