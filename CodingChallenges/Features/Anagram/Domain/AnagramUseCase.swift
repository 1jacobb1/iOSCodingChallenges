//
//  AnagramUseCase.swift
//  CodingChallenges
//
//  Created by Jacob on 6/12/26.
//

import Foundation

struct AnagramUseCase {
    func isAnagram(text: String, otherText: String) -> Bool? {
        guard !text.isEmpty && !otherText.isEmpty else {
            return nil
        }

        return text.isAnagram(otherWord: otherText)
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
