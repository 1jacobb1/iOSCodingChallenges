//
//  CodingChallengesCoordinatorView.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import SwiftUI
import Combine

struct CodingChallengesCoordinatorView: View {
    @ObservedObject private var coordinator: CodingChallengesCoordinator
    private var appContainer: AppContainer
    private var codingChallengesViewModel: CodingChallengesViewModel

    init(coordinator: CodingChallengesCoordinator, appContainer: AppContainer) {
        self.coordinator = coordinator
        self.appContainer = appContainer
        self.codingChallengesViewModel = CodingChallengesViewModel()
        self.codingChallengesViewModel.onTapItem = onTapItem(route:)
    }

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            CodingChallengesScreen(viewModel: codingChallengesViewModel)
                .navigationDestination(for: CodingChallengesRoute.self) { route in
                    switch route {
                    case .spatialDecoder:
                        appContainer.makeSpatialDecoderScreen()
                    case .palindrome:
                        appContainer.makePalindromeScreen()
                    }
                }
        }
    }

    func onTapItem(route: CodingChallengesRoute) {
        coordinator.navigate(to: route)
    }
}
