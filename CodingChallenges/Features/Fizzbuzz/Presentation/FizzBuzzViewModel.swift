//
//  FizzBuzzViewModel.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import SwiftUI
import Combine

@Observable final class FizzBuzzViewModel {
    var textInput: Int? = nil
    let useCase = FizzbuzzUseCase()
    var result: [String] = []

    func onSubmit() {
        handleResult()
    }

    private func handleResult() {
        Task {
            result = await useCase.getResult(input: textInput ?? 0)
        }
    }
}
