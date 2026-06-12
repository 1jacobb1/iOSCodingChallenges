//
//  PalindromeViewModelTests.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import XCTest
@testable import CodingChallenges

final class PalindromeViewModelTests: XCTestCase {
    private var sut: PalindromeViewModel!

    override func setUp() {
        super.setUp()
        sut = PalindromeViewModel()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testPalindrome() {
        let inputs: [(text: String, expectation: Bool?)] = [
            ("racecar", true),
            ("racer", false),
            ("noon", true),
            ("moon", false),
            ("week", false),
            ("step on no pets", true),
            ("", nil),
            ("a", nil)
        ]

        let result = inputs.map {
            let text = $0.text
            sut.textInput = text
            sut.handleTextOnChange(text: text)
            return sut.isValid == $0.expectation
        }

        let resultContainsFalse = result.contains { !$0 }
        XCTAssertFalse(resultContainsFalse)
    }
}
