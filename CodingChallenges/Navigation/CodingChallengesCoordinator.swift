//
//  CodingChallengesCoordinator.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import Combine

final class CodingChallengesCoordinator: ObservableObject {
    @Published var path: [CodingChallengesRoute] = []

    func start() {
        path = []
    }

    func navigate(to destination: CodingChallengesRoute) {
        path.append(destination)
    }

    func popToRoot() {
        path = []
    }

    func navigateToPreviousScreen() {
        path = Array(path.dropLast())
    }
}
