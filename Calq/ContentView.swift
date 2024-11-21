//
//  ContentView.swift
//  Calq
//
//  Created by Yolima Pereira Ruiz on 19/11/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CalculatorViewModel()

    // Buttons for the calculator
    let buttons: [[CalculatorButton]] = [
        [.operation("C"), .operation("sin"), .operation("cos"), .operation("tan")],
        [.digit("7"), .digit("8"), .digit("9"), .operation("÷")],
        [.digit("4"), .digit("5"), .digit("6"), .operation("×")],
        [.digit("1"), .digit("2"), .digit("3"), .operation("-")],
        [.digit("0"), .digit("."), .operation("="), .operation("+")]
    ]
    
    let extendedButtons: [[CalculatorButton]] = [
        [.operation("C"), .operation("sin"), .operation("cos"), .operation("tan")],
        [.digit("7"), .digit("8"), .digit("9"), .operation("÷")],
        [.digit("4"), .digit("5"), .digit("6"), .operation("×")],
        [.digit("1"), .digit("2"), .digit("3"), .operation("-")],
        [.digit("0"), .operation("."), .operation("="), .operation("+")]
    ]
    
    var body: some View {
        GeometryReader { geometry in
            if geometry.size.width > geometry.size.height {
                // Landscape layout
                VStack(spacing: 12) {
                    // Display for input and result
                    VStack {
                        Text(viewModel.operationDisplay) // Operation in progress
                            .font(.title)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 20)
                            .padding(.top, 8)

                        Text(viewModel.result) // Result
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 20)
                            .padding(.bottom, 8)
                    }
                    .frame(height: 100)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                    .frame(height: geometry.size.height * 0.3) // Allocate 30% of height for display

                    // Buttons in a grid layout
                    VStack(spacing: 12) {
                        ForEach(extendedButtons, id: \.self) { row in
                            HStack(spacing: 12) {
                                ForEach(row, id: \.self) { button in
                                    Button(action: {
                                        handleButtonPress(button)
                                    }) {
                                        Text(button.label)
                                            .font(.title)
                                            .frame(width: (geometry.size.width / CGFloat(row.count)) - 16,
                                                   height: 40)
                                            .background(button.color)
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
            } else {
                // Portrait layout
                VStack(spacing: 12) {
                    Spacer()
                    // Display for input and result
                    VStack(alignment: .trailing, spacing: 10) {
                        Text(viewModel.operationDisplay) // Operation in progress
                            .font(.title)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.horizontal)

                        Text(viewModel.result) // Result
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.horizontal)
                    }
                    .frame(height: 100)
                    .padding(.vertical)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)

                    // Buttons in a grid layout
                    ForEach(buttons, id: \.self) { row in
                        HStack(spacing: 12) {
                            ForEach(row, id: \.self) { button in
                                Button(action: {
                                    handleButtonPress(button)
                                }) {
                                    Text(button.label)
                                        .font(.title)
                                        .frame(width: 80, height: 80)
                                        .background(button.color)
                                        .foregroundColor(.white)
                                        .cornerRadius(40)
                                }
                            }
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
            }
        }
    }
    

    // Handle button presses
    private func handleButtonPress(_ button: CalculatorButton) {
        switch button {
        case .digit(let value):
            viewModel.input(value)
        case .operation(let operation):
            if operation == "C" {
                viewModel.clear()
            } else if operation == "=" {
                viewModel.calculateResult()
            } else {
                viewModel.selectOperation(operation)
            }
        }
    }
}



#Preview {
    ContentView()
}
