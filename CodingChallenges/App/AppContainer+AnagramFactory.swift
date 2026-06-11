//
//  AppContainer+AnagramFactory.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

protocol AnagramFactory {
    func makeAnagramScreen() -> AnagramScreen
}

extension AppContainer {
    func makeAnagramScreen() -> AnagramScreen {
        AnagramScreen(viewModel: AnagramViewModel())
    }
}
