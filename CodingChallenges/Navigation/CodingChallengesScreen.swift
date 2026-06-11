//
//  CodingChallengesScreen.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import SwiftUI

struct CodingChallengesScreen: View {
    private var viewModel: CodingChallengesViewModel

    init(viewModel: CodingChallengesViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            ForEach(viewModel.codingChallenges, id: \.title) { item in
                Button(action: { viewModel.onTapItem?(item.route) }) {
                    VStack(alignment: .leading, spacing: 8) {
                        TitleDescriptionView(title: item.title, description: item.description)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .padding(16)
            }
        }
        .navigationTitle("Coding Challenges")
    }
}

struct CodingChallengesScreenPreview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CodingChallengesScreen(viewModel: CodingChallengesViewModel())
        }
    }
}
