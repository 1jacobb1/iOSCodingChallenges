//
//  AnagramViewModelTests.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import XCTest
@testable import CodingChallenges

final class AnagramViewModelTests: XCTestCase {
    var sut: AnagramViewModel!

    override func setUp() {
        super.setUp()
        sut = AnagramViewModel()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testAnagram() {
        let inputs: [(text1: String, text2: String, expectation: Bool?)] = [
            ("item 1", "item 2", false),
            ("item", "mite", true),
            ("item", "meti", true),
            ("item", "teim", true),
            ("racecar", "racer", false),
            ("item", "", nil),
            ("", "item1", nil),
            ("item", "haha", false)
        ]

        let results = inputs.map { item in
            sut.textInput1 = item.text1
            sut.textInput2 = item.text2
            sut.handleText1OnChange(text: item.text1)
            sut.handleText2OnChange(text: item.text2)
            return sut.isValid == item.expectation
        }

        // Test result should not contain false
        let resultContainsFalse = results.contains { !$0 }
        XCTAssertFalse(resultContainsFalse)
    }
}
