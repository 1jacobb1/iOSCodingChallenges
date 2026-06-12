//
//  AnagramViewModel.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import SwiftUI
import Combine

@Observable final class AnagramViewModel {
    var textInput1 = ""
    var textInput2 = ""
    var isValid: Bool? = nil
    let useCase: AnagramUseCase

    init(useCase: AnagramUseCase = AnagramUseCase()) {
        self.useCase = useCase
    }

    func handleText1OnChange(text: String) {
        handleTextChange(text: text, otherText: textInput2)
    }

    func handleText2OnChange(text: String) {
        handleTextChange(text: textInput1, otherText: text)
    }

    private func handleTextChange(text: String, otherText: String) {
        isValid = useCase.isAnagram(text: text, otherText: otherText)
    }
}
