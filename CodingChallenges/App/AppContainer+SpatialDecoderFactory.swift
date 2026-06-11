//
//  AppContainer+SpatialDecoderFactory.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

protocol SpatialDecoderFactory {
    func makeSpatialDecoderScreen() -> SpatialDecoderScreen
}

extension AppContainer {
    func makeSpatialDecoderScreen() -> SpatialDecoderScreen {
        let repository = SpatialRepository(api: apiClient)
        let useCase = SpatialDecodeUseCase(repository: repository)
        return SpatialDecoderScreen(viewModel: SpatialDecoderViewModel(decodeUseCase: useCase))
    }
}
