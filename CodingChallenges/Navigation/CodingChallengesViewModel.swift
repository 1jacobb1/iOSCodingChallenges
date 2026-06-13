//
//  CodingChallengesViewModel.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import SwiftUI

@Observable class CodingChallengesViewModel {
    var codingChallenges: [(title: String, description: String, route: CodingChallengesRoute)]
    var onTapItem: ((CodingChallengesRoute) -> ())?

    init(onTapItem: ((CodingChallengesRoute) -> Void)? = nil) {
        self.codingChallenges = [
            (
                title: "Spatial Decoder",
                description: "is a component or function that reconstructs readable text or output by interpreting data based on spatial coordinates (e.g., placing characters at specific x, y positions to form a message or image).",
                route: .spatialDecoder
            ),
            (
                title: "Palindrome",
                description: "is a word, phrase, number, or sequence that reads the same both forward and backward.",
                route: .palindrome
            ),
            (
                title: "Anagram",
                description: "An anagram is a word or phrase formed by rearranging the letters of another word or phrase. To create a perfect anagram, you must use all the original letters exactly once.",
                route: .anagram
            ),
            (
                title: "Fizzbuzz",
                description: "Given a number that displays from 1 to n, and displays `fizzbuzz` if number is divisible by 5 and 3, `fizz` if divisable by 3, `buzz` if divisable by 5.",
                route: .fizzbuzz
            )
        ]
        self.onTapItem = onTapItem
    }
}
