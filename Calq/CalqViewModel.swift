//
//  CalqViewModel.swift
//  Calq
//
//  Created by Yolima Pereira Ruiz on 19/11/24.
//


import Foundation

class CalculatorViewModel: ObservableObject {
    @Published var input1: String = "" // First input
    @Published var input2: String = "" // Second input
    @Published var result: String = "0" // Result displayed on the screen
    @Published var currentOperation: String? = nil // Current selected operation
    @Published var lastOperationDisplay: String = "" // Last operation displayed

    var operationDisplay: String {
        if !lastOperationDisplay.isEmpty && currentOperation == nil {
            return lastOperationDisplay // Show last operation if result is available
        } else if let currentOperation = currentOperation {
            if input2.isEmpty {
                return "\(input1) \(currentOperation)" // Show first number and operator
            } else {
                return "\(input1) \(currentOperation) \(input2)" // Show full operation
            }
        } else {
            return input1 // Show just the first input if no operation is selected
        }
    }

    
    func input(_ value: String) {
        if value == "." {
            // Handle decimal point
            if currentOperation == nil {
                // Writing input1
                if input1.isEmpty {
                    input1 = "0."
                } else if !input1.contains(".") {
                    input1 += value
                }
            } else {
                // Writing input2
                if input2.isEmpty {
                    input2 = "0."
                } else if !input2.contains(".") {
                    input2 += value
                }
               
            }
        } else {
            // Handle regular digits
            if currentOperation == nil {
                input1 += value
            } else {
                input2 += value
            }
        }
    }

    func selectOperation(_ operation: String) {
        if operation == "sin" || operation == "cos" || operation == "tan" {
                   performTrigonometricOperation(operation)
               } else 
        if !input1.isEmpty {
            if input1.hasSuffix(".") {
                input1 += "0" // Complete input1 if it ends with "."
            }
            currentOperation = operation
               }
    }

    func calculateResult() {
        guard let operation = currentOperation,
              let value1 = Double(input1),
              let value2 = Double(input2) else {
            result = "Error"
            return
        }

        lastOperationDisplay = "\(input1) \(operation) \(input2)"

        switch operation {
        case "+":
            result = String(CalculatorCore.add(value1, with: value2))
        case "-":
            result = String(CalculatorCore.subtract(value1, with: value2))
        case "×":
            result = String(CalculatorCore.multiply(value1, with: value2))
        case "÷":
            result = value2 != 0 ? String(CalculatorCore.divide(value1, by: value2))  : "Error: Division by zero"
        default:
            result = "Unknown operation"
        }

        if let numericResult = Double(result) {
            input1 = String(numericResult)
        } else {
            input1 = ""
        }
        input2 = ""
        currentOperation = nil
    }

    func performTrigonometricOperation(_ operation: String) {
        guard let value = Double(input1) else {
            result = "Error"
            return
        }

        lastOperationDisplay = "\(operation)(\(input1))"
        
        switch operation {
        case "sin":
            result = String(CalculatorCore.sine(value))
        case "cos":
            result = String(CalculatorCore.cosine(value))
        case "tan":
            let tan = String(CalculatorCore.tangent(value))
            if tan == "nan" {
                result = "Undefined"
            } else {
                result = tan
            }
            
        default:
            result = "Unknown operation"
        }

        input1 = result
        input2 = ""
        currentOperation = nil
    }

    func clear() {
        input1 = ""
        input2 = ""
        result = "0"
        currentOperation = nil
        lastOperationDisplay = ""
    }
}
