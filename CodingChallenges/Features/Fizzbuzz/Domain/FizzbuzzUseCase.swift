//
//  FizzbuzzUseCase.swift
//  CodingChallenges
//
//  Created by Jacob on 6/12/26.
//

import Foundation

struct FizzbuzzUseCase {
//    The FizzBuzz challenge goes something like this. Write a function that does the following:
//
//    console logs the numbers from 1 to n, where n is the integer the function takes as its parameter
//    logs fizz instead of the number for multiples of 3
//    logs buzz instead of the number for multiples of 5
//    logs fizzbuzz for numbers that are multiples of both 3 and 5
    func getResult(input: Int) async -> [String] {
        guard input > 0 else { return [] }
        return await withCheckedContinuation { continuation in
            DispatchQueue.global(qos: .userInitiated).async {
                print("getResult - start processing, is running in main thread? \(Thread.isMainThread)")
                var result: [String] = []
                var number = 1
                let maxLimit = 10000
                let limit = input > maxLimit ? maxLimit : input
                while number <= limit {
                    result.append(getFizzBuzz(input: number))
                    number += 1
                }
                continuation.resume(with: .success(result))
            }
        }
    }

    private func getFizzBuzz(input: Int) -> String {
        if input % 5 == 0 && input % 3 == 0 {
            return "fizzbuzz"
        } else if input % 3 == 0 {
            return "fizz"
        } else if input % 5 == 0 {
            return "buzz"
        }
        return String(input)
    }
}
