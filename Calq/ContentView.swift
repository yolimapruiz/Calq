//
//  ContentView.swift
//  Calq
//
//  Created by Yolima Pereira Ruiz on 19/11/24.
//
//import SwiftUI
//
//struct ContentView: View {
//    @StateObject private var viewModel = CalculatorViewModel()
//
//    var body: some View {
//        VStack(spacing: 20) {
//            // Input fields
//            TextField("Input 1 (Required)", text: $viewModel.input1)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .keyboardType(.decimalPad)
//
//            TextField("Input 2 (Optional for trigonometric Ops)", text: $viewModel.input2)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .keyboardType(.decimalPad)
//
//            // Buttons for operations
//            HStack {
//                Button("Add") {
//                    viewModel.performOperation("+")
//                }
//                .buttonStyle(CalculatorButtonStyle())
//
//                Button("Subtract") {
//                    viewModel.performOperation("-")
//                }
//                .buttonStyle(CalculatorButtonStyle())
//
//                Button("Multiply") {
//                    viewModel.performOperation("×")
//                }
//                .buttonStyle(CalculatorButtonStyle())
//
//                Button("Divide") {
//                    viewModel.performOperation("÷")
//                }
//                .buttonStyle(CalculatorButtonStyle())
//            }
//            
//            //section for trigonometric operations
//            VStack(spacing: 10) {
//                Text("Trigonometric Operations")
//                    .font(.headline)
//                
//                HStack {
//                    Button("Sin") {
//                        viewModel.performOperation("sin")
//                    }
//                    .buttonStyle(CalculatorButtonStyle())
//                    
//                    Button("Cos") {
//                        viewModel.performOperation("cos")
//                    }
//                    .buttonStyle(CalculatorButtonStyle())
//                    
//                    Button("Tin") {
//                        viewModel.performOperation("tan")
//                    }
//                    .buttonStyle(CalculatorButtonStyle())
//                }
//            }
//
//            // Clear button
//            Button("Clear") {
//                viewModel.clear()
//            }
//            .buttonStyle(CalculatorButtonStyle())
//
//            // Display the result
//            Text("Result: \(viewModel.result)")
//                .font(.largeTitle)
//        }
//        .padding()
//    }
//}
//
//// Custom button style
//struct CalculatorButtonStyle: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .padding()
//            .background(Color.blue)
//            .foregroundColor(.white)
//            .cornerRadius(10)
//            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
//    }
//}



import SwiftUI

struct ContentView: View {
    @StateObject private var model = CalculatorViewModel() // ViewModel

    // Buttons for the calculator
    let buttons: [[CalculatorButton]] = [
        [.operation("C"), .operation("sin"), .operation("cos"), .operation("tan")],
        [.digit("7"), .digit("8"), .digit("9"), .operation("÷")],
        [.digit("4"), .digit("5"), .digit("6"), .operation("×")],
        [.digit("1"), .digit("2"), .digit("3"), .operation("-")],
        [.digit("0"), .digit("."), .operation("="), .operation("+")]
    ]

    var body: some View {
        VStack(spacing: 12) {
            // Display for input and result
            VStack(alignment: .trailing, spacing: 10) {
                Text(model.operationDisplay) // Operation in progress
                    .font(.title)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal)

                Text(model.result) // Result
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal)
            }
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

    // Handle button presses
    private func handleButtonPress(_ button: CalculatorButton) {
        switch button {
        case .digit(let value):
            model.input(value)
        case .operation(let operation):
            if operation == "C" {
                model.clear()
            } else if operation == "=" {
                model.calculateResult()
            } else {
                model.selectOperation(operation)
            }
        }
    }
}

// Enum for button types
enum CalculatorButton: Hashable {
    case digit(String)
    case operation(String)

    var label: String {
        switch self {
        case .digit(let value): return value
        case .operation(let value): return value
        }
    }

    var color: Color {
        switch self {
        case .digit: return Color.gray
        case .operation: return Color.orange
        }
    }
}

#Preview {
    ContentView()
}
