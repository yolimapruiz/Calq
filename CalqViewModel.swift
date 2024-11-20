//
//  CalqViewModel.swift
//  Calq
//
//  Created by Yolima Pereira Ruiz on 19/11/24.
//

//import Foundation
//
//class CalculatorViewModel: ObservableObject {
//    @Published var input1: String = ""
//    @Published var input2: String = ""
//    @Published var result: String = "0"
//    @Published var currentOperation: String = ""
//
//    func performOperation(_ operation: String) {
//        Task {
//            switch operation {
//            case "+", "-", "x", "÷":
//                await validateArithmetricInputs(operation: operation)
//                
//                
//            case "sin", "cos", "tan":
//                await validateTrigonometricInput(operation: operation)
//                
//            default:
//                result = "Unknown Operation"
//                
//            }
//        }
//        
//    }
//    
//    private func validateArithmetricInputs(operation: String) async {
//        guard let value1 = Double(input1), let value2 = Double(input2) else {
//            result = "Error: both inputs needed"
//            return
//        }
//        
//        switch operation {
//        case "+":
//            result = String(CalculatorCore.add(value1, with: value2))
//        case "-":
//            result = String(CalculatorCore.subtract(value1, with: value2))
//        case "×":
//            result = String(CalculatorCore.multiply(value1, with: value2))
//        case "÷":
//            result = value2 != 0 ? String(CalculatorCore.divide(value1, by: value2)) : "Error: Division by zero"
//        default:
//            break
//        }
//        
//    }
//    
//    private func validateTrigonometricInput(operation: String) async {
//       guard let value1 = Double(input1) else {
//            result = "Error: input needed"
//            return
//        }
//        
//        switch operation {
//            case "sin":
//            result = String(CalculatorCore.sine(value1))
//        case "cos":
//            result = String(CalculatorCore.cosine(value1))
//        case "tan":
//            result = String(CalculatorCore.tangent(value1))
//        default:
//            break
//        }
//    }
////        guard let value1 = Double(input1), let value2 = Double(input2) else {
////            result = "Invalid input"
////            return
////        }
//
////        switch operation {
////        case "+":
////            result = String(CalculatorCore.add(value1, with: value2))
////        case "-":
////            result = String(CalculatorCore.subtract(value1, with: value2))
////        case "×":
////            result = String(CalculatorCore.multiply(value1, with: value2))
////        case "÷":
////            result = value2 != 0 ? String(CalculatorCore.divide(value1, by: value2)) : "Error: Division by zero"
////        case "sin":
////            result = String(CalculatorCore.sine(value1))
////        case "cos":
////            result = String(CalculatorCore.cosine(value1))
////        case "tan":
////            result = String(CalculatorCore.tangent(value1))
////        
////        default:
////            result = "Unknown operation"
////        }
////    }
//
//    func clear() {
//        input1 = ""
//        input2 = ""
//        result = "0"
//        currentOperation = ""
//    }
//}

//import Foundation
//
//class CalculatorModel: ObservableObject {
//    @Published var input1: String = "" // First input
//    @Published var input2: String = "" // Second input
//    @Published var result: String = "0" // Result displayed on the screen
//    @Published var currentOperation: String? = nil // Current selected operation
//
//    /// Handles the user's input for numbers and operations
//    func input(_ value: String) {
//        if let operation = currentOperation {
//            // If an operation is already selected, assign value to input2
//            input2 += value
//        } else {
//            // Otherwise, assign value to input1
//            input1 += value
//        }
//    }
//
//    /// Sets the current operation (+, -, ×, ÷, etc.)
//    func selectOperation(_ operation: String) {
//        if !input1.isEmpty {
//            currentOperation = operation
//        }
//    }
//
//    /// Performs the selected operation when "=" is pressed
//    func calculateResult() {
//        guard let operation = currentOperation,
//              let value1 = Double(input1),
//              let value2 = Double(input2) else {
//            result = "Error: Incomplete inputs"
//            return
//        }
//
//        switch operation {
//        case "+":
//            result = String(CalculatorCore.add(value1, with: value2))
//        case "-":
//            result = String(CalculatorCore.subtract(value1, with: value2))
//        case "×":
//            result = String(CalculatorCore.multiply(value1, with: value2))
//        case "÷":
//            result = value2 != 0 ? String(CalculatorCore.divide(value1, by: value2)) : "Error: Cannot divide by zero"
//        default:
//            result = "Unknown operation"
//        }
//
//        // Reset inputs and operation after calculation
//        clearAfterCalculation()
//    }
//
//    /// Clears inputs and resets the current operation
//    func clear() {
//        input1 = ""
//        input2 = ""
//        result = "0"
//        currentOperation = nil
//    }
//
//    /// Clears inputs after a successful calculation
//    private func clearAfterCalculation() {
//        input1 = result
//        input2 = ""
//        currentOperation = nil
//    }
//}

//version mas funcional sin calculos de decimales
//import Foundation
//
//class CalculatorViewModel: ObservableObject {
//    @Published var input1: String = "" // First input
//    @Published var input2: String = "" // Second input
//    @Published var result: String = "0" // Result displayed on the screen
//    @Published var currentOperation: String? = nil // Current selected operation
//    @Published var lastOperationDisplay: String = "" // Last operation displayed
//
//    /// Represents the operation being entered or executed
//    var operationDisplay: String {
//        if result != "0" && lastOperationDisplay != "" {
//            return lastOperationDisplay // Show last operation if result is available
//        } else if let currentOperation = currentOperation {
//            if input2.isEmpty {
//                return "\(input1) \(currentOperation)" // Show first number and operator
//            } else {
//                return "\(input1) \(currentOperation) \(input2)" // Show full operation
//            }
//        } else {
//            return input1 // Show just the first input if no operation is selected
//        }
//    }
//
//    /// Handles user input for numbers and decimal points
//    func input(_ value: String) {
//        if currentOperation != nil {
//            // If an operation is selected, set or update input2
//            if input2.isEmpty || input2 == "0" {
//                input2 = value // Replace default value
//            } else {
//                input2 += value // Append new digit
//            }
//        } else {
//            // Otherwise, set or update input1
//            if input1.isEmpty || input1 == "0" {
//                input1 = value // Replace default value
//            } else {
//                input1 += value // Append new digit
//            }
//        }
//    }
//
//    /// Sets the current operation (+, -, ×, ÷) or executes trigonometric functions immediately
//    func selectOperation(_ operation: String) {
//        if operation == "sin" || operation == "cos" || operation == "tan" {
//            performTrigonometricOperation(operation)
//        } else if !input1.isEmpty {
//            currentOperation = operation
//        }
//    }
//
//    /// Performs the selected arithmetic operation when "=" is pressed
//    func calculateResult() {
//        guard let currentOperation = currentOperation,
//              let value1 = Double(input1),
//              let value2 = Double(input2) else {
//            result = "Error"
//            return
//        }
//
//        // Save the current operation to display after calculation
//        lastOperationDisplay = "\(input1) \(currentOperation) \(input2)"
//
//        switch currentOperation {
//        case "+":
//            result = String(CalculatorCore.add(value1, with: value2))
//        case "-":
//            result = String(CalculatorCore.subtract(value1, with: value2))
//        case "×":
//            result = String(CalculatorCore.multiply(value1, with: value2))
//        case "÷":
//            result = value2 != 0 ? String(CalculatorCore.divide(value1, by: value2)) : "Error: Division by zero"
//        default:
//            result = "Unknown operation"
//        }
//
//        // Clear inputs after showing the result
//        clearAfterCalculation()
//    }
//
//    /// Executes trigonometric operations immediately
//    private func performTrigonometricOperation(_ operation: String) {
//        guard let value = Double(input1) else {
//            result = "Error"
//            return
//        }
//
//        // Save the trigonometric operation to display
//        lastOperationDisplay = "\(operation)(\(input1))"
//
//        switch operation {
//        case "sin":
//            result = String(CalculatorCore.sine(value))
//        case "cos":
//            result = String(CalculatorCore.cosine(value))
//        case "tan":
//            result = String(CalculatorCore.tangent(value))
//        default:
//            result = "Unknown operation"
//        }
//
//        // Update inputs after trigonometric operation
//        input1 = result
//        input2 = ""
//        currentOperation = nil
//    }
//
//    /// Clears all inputs and resets the operation
//    func clear() {
//        input1 = ""
//        input2 = ""
//        result = "0"
//        currentOperation = nil
//        lastOperationDisplay = ""
//    }
//
//    /// Clears inputs after a successful calculation
//    private func clearAfterCalculation() {
//        input1 = result // Keep the result as input1 for further calculations
//        input2 = ""
//        currentOperation = nil
//    }
//}


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

//    func input(_ value: String) {
//        if value == "." || !input1.isEmpty {
//            // Handle decimal point
//            
//            input1 += input1.isEmpty ? "0." : "."
//            input1 += value
//            
//            print("input1: \(input1)")
//            
//          
//        } else {
//            // Handle regular digits
//            if currentOperation == nil {
//                input1 += value
//                
//                print("input1 aqui : \(input1)")
//            } else {
//                if value == "." || !input2.isEmpty {
//                    // Handle decimal point
//                    
//                    input2 += input2.isEmpty ? "0." : "."
//                    input2 += value
//                    
//                    print("input2: \(input2)")
//                    
//                  
//                } else {
//                    input2 += value
//                }
//                
//               // print("input1: \(input2)")
//            }
//        }
//    }
    
    func input(_ value: String) {
        print("DEBUG: se recibio el valor \(value)")
        if value == "." {
            // Handle decimal point
            print("DEBUG: SE PRESIONO PUNTO DECIMAL")
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
        
        print("input1: \(input1), input2: \(input2)")
    }

    func selectOperation(_ operation: String) {
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
            result = String(value1 + value2)
        case "-":
            result = String(value1 - value2)
        case "×":
            result = String(value1 * value2)
        case "÷":
            result = value2 != 0 ? String(value1 / value2) : "Error: Division by zero"
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
            result = String(sin(value * .pi / 180)) // Convert to radians
        case "cos":
            result = String(cos(value * .pi / 180)) // Convert to radians
        case "tan":
            result = String(tan(value * .pi / 180)) // Convert to radians
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
