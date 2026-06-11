//
//  PalindromeScreen.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import SwiftUI

struct PalindromeScreen: View {
    @Bindable var viewModel: PalindromeViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("A palindrome is a word, phrase, number, or sequence that reads the same both forward and backward.")
                Text("Example: \nNoon \nana \nStep on no pets")
                    .padding(.top, 3)


                Text("Enter text or sentence to check if it is a *PALINDROME* or *NOT*")
                    .padding(.top, 10)

                TextField("Enter text or sentence", text: $viewModel.textInput)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 16)
                    .overlay(
                        Capsule()
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    .padding(.vertical, 10)
                    .onChange(of: viewModel.textInput) { oldValue, newValue in
                        viewModel.handleTextOnChange(text: newValue)
                    }

                if let isValid = viewModel.isValid {
                    Text(isValid ? "The text above is a PALINDROME" : "The text above is NOT PALINDROME")
                        .foregroundStyle(isValid ? Color.green : Color.red)
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Palindrome")
    }
}

#Preview {
    NavigationStack {
        PalindromeScreen(viewModel: PalindromeViewModel())
    }
}
