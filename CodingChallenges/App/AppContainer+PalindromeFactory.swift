//
//  AppContainer+PalindromeFactory.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

protocol PalindromeFactory {
    func makePalindromeScreen() -> PalindromeScreen
}

extension AppContainer {
    func makePalindromeScreen() -> PalindromeScreen {
        PalindromeScreen(viewModel: PalindromeViewModel())
    }
}
