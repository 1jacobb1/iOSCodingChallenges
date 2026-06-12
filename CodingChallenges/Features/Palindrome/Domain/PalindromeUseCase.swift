//
//  PalindromeUseCase.swift
//  CodingChallenges
//
//  Created by Jacob on 6/12/26.
//

struct PalindromeUseCase {
    func isPalindrome(text: String) -> Bool? {
        guard text.count >= 2 else {
            return nil
        }
        return text.isPalindrome()
    }
}

extension String {
    func isPalindrome() -> Bool {
        let reversed = String(self.reversed())
        return self.lowercased() == reversed.lowercased()
    }
}
