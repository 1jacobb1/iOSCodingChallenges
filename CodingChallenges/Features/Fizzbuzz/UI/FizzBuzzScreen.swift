//
//  PalindromeScreen.swift
//  CodingChallenges
//
//  Created by Jacob on 6/11/26.
//

import SwiftUI

struct FizzBuzzScreen: View {
    @Bindable var viewModel: FizzBuzzViewModel

    let description = """
        Write a function that does the following:
        
        console logs the numbers from 1 to n,\nwhere n is the integer the function takes as its parameter.
        logs fizz instead of the number for multiples of 3
        logs buzz instead of the number for multiples of 5
        logs fizzbuzz for numbers that are multiples of both 3 and 5\n
        Example: 
        1. input: 15
        output:
            1
            2
            fizz
            4
            buzz
            fizz
            7
            8
            fizz
            buzz
            11
            fizz
            13
            14
            fizzbuzz
        """

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                Text(description)

                HStack {
                    TextField(
                        "Enter number greater than 0",
                        value: $viewModel.textInput,
                        format: .number
                    )
                    .keyboardType(.numberPad)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 16)
                    .overlay(
                        Capsule()
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    .padding(.vertical, 10)

                    Button(action: viewModel.onSubmit) {
                        Text("Submit")
                            .foregroundStyle(Color.blue)
                            .padding(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.leading, 8)
                }

                Text("Enter a number and click submit to see the result.")

                if !viewModel.result.isEmpty {
                    Text("Result: ")
                    ForEach(viewModel.result.indices, id: \.self) { index in
                        Text(viewModel.result[index])
                    }
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Fizzbuzz")
    }
}

#Preview {
    NavigationStack {
        FizzBuzzScreen(viewModel: FizzBuzzViewModel())
    }
}
