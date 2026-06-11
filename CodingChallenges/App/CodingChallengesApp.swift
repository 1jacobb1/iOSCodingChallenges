//
//  CodingChallengesApp.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import SwiftUI

@main
struct CodingChallengesApp: App {
    private var appContainer = AppContainer()

    var body: some Scene {
        WindowGroup {
            CodingChallengesCoordinatorView(coordinator: appContainer.codingChallengeCoordinator, appContainer: appContainer)
        }
    }
}
