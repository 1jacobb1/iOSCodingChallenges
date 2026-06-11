//
//  AppContainer.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

class AppContainer: AppFactory {
    let codingChallengeCoordinator = CodingChallengesCoordinator()
    let apiClient: APIClient = URLSessionAPIClient()

    init() {}
}
