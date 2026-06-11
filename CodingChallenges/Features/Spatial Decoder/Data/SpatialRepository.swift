//
//  SpatialRepository.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import Foundation

struct SpatialRepository: SpatialRepositoryProtocol {
    let api: APIClient

    init(api: APIClient) {
        self.api = api
    }

    func execute() async throws -> [String] {
        let htmlString = try await api.request(endpoint: SpatialEndpoint())
        let decryptedMessage = SpatialDataExtractor().decryptMessage(htmlString: htmlString)
        return decryptedMessage
    }
}
