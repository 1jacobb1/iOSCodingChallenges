//
//  CodingChallengeRow.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import SwiftUI

struct TitleDescriptionView: View {
    private var title: String
    private var description: String

    init(title: String, description: String) {
        self.title = title
        self.description = description
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title)
            Text(description)
                .padding(.horizontal, 8)
        }
    }
}
