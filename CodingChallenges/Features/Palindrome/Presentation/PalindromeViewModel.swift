//
//  PalindromeViewModel.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import SwiftUI
import Combine

@Observable final class PalindromeViewModel {
    var textInput = ""
    var isValid: Bool? = nil
    let useCase = PalindromeUseCase()

    func handleTextOnChange(text: String) {
        isValid = useCase.isPalindrome(text: text)
    }
}
