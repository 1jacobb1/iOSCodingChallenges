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

    func handleText1OnChange(text: String) {
        handleTextChange(text: text, otherText: textInput2)
    }

    func handleText2OnChange(text: String) {
        handleTextChange(text: textInput1, otherText: text)
    }

    private func handleTextChange(text: String, otherText: String) {
        if text.isEmpty || otherText.isEmpty {
            isValid = nil
        } else {
            isValid = text.isAnagram(otherWord: otherText)
        }
    }
}

extension String {
    func isAnagram(otherWord: String) -> Bool {
        let thisText = self.lowercased().replacingOccurrences(of: " ", with: "")
        let otherText = otherWord.lowercased().replacingOccurrences(of: " ", with: "")
        guard thisText.count == otherText.count else { return  false }
        return thisText.sorted() == otherText.sorted()
    }
}
