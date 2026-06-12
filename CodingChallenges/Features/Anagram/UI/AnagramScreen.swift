//
//  AnagramScreen.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import SwiftUI

struct AnagramScreen: View {
    @Bindable var viewModel: AnagramViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("An anagram is a word or phrase formed by rearranging the letters of another word or phrase. To create a perfect anagram, you must use all the original letters exactly once.")

                Text("Example: \nListen -> Silent \n Debit Card -> Bad credit \n Dormityor -> Dirty room")
                    .padding(.top, 3)

                Text("Enter text or sentence to check if it is an *ANAGRAM* or *NOT*")
                    .padding(.top, 10)

                Text("First word or sentence")
                    .padding(.top, 10)

                TextField("Enter text or sentence for textfield 1", text: $viewModel.textInput1)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 16)
                    .overlay(
                        Capsule()
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    .padding(.vertical, 3)
                    .onChange(of: viewModel.textInput1) { oldValue, newValue in
                        viewModel.handleText1OnChange(text: newValue)
                    }

                Text("Second word or sentence")
                    .padding(.top, 10)

                TextField("Enter text or sentence for textfield 2", text: $viewModel.textInput2)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 16)
                    .overlay(
                        Capsule()
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    .padding(.vertical, 3)
                    .onChange(of: viewModel.textInput2) { oldValue, newValue in
                        viewModel.handleText2OnChange(text: newValue)
                    }

                if let isValid = viewModel.isValid {
                    Text(isValid ? "Result: The text above is an ANAGRAM" : "Result: The text above is NOT ANAGRAM")
                        .foregroundStyle(isValid ? Color.green : Color.red)
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Anagram")
    }
}

#Preview {
    NavigationStack {
        AnagramScreen(viewModel: AnagramViewModel())
    }
}
