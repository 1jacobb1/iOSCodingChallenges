//
//  SpatialDecoderScreen.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import SwiftUI

struct SpatialDecoderScreen: View {
    private var viewModel: SpatialDecoderViewModel

    init(viewModel: SpatialDecoderViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView(.vertical) {
            Text("The result coming from [this url](https://docs.google.com/document/d/e/2PACX-1vSvM5gDlNvt7npYHhp_XfsJvuntUhq184By5xO_pA4b_gCWeXb6dM6ZxwN8rE6S4ghUsCj2VKR21oEP/pub) is shown below.")
                .padding()

            ScrollView(.horizontal) {
                VStack(alignment: .leading) {
                    Text(viewModel.messages.joined(separator: "\n"))
                }
                .padding()
                Spacer()
            }
        }
        .navigationTitle("Spatial Decoder")
        .task { viewModel.handleOnAppear() }
    }
}
