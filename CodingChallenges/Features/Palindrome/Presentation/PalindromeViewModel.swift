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

    func handleTextOnChange(text: String) {
        if text.count >= 2 {
            isValid = text.isPalindrome()
        } else {
            isValid = nil
        }
    }
}

extension String {
    func isPalindrome() -> Bool {
        let reversed = String(self.reversed())
        return self.lowercased() == reversed.lowercased()
    }
}
