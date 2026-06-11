//
//  SpatialDecoderViewModel.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import SwiftUI

@Observable final class SpatialDecoderViewModel {
    var messages: [String] = []

    private let decodeUseCase: SpatialDecodeUseCase

    init(decodeUseCase: SpatialDecodeUseCase) {
        self.decodeUseCase = decodeUseCase
    }

    func handleOnAppear() {
        Task {
            do {
                let messages = try await decodeUseCase.execute()
                self.messages = messages
            } catch {
                debugPrint("error: \(error)")
            }
        }
    }
}
