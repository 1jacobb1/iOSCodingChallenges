//
//  AppContainer+FizzbuzzFactory.swift
//  CodingChallenges
//
//  Created by Jacob on 6/13/26.
//

protocol FizzbuzzFactory {
    func makeFizzbuzzScreen() -> FizzBuzzScreen
}

extension AppContainer {
    func makeFizzbuzzScreen() -> FizzBuzzScreen {
        FizzBuzzScreen(viewModel: FizzBuzzViewModel())
    }
}
