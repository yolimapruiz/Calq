//
//  CalculatorButton.swift
//  Calq
//
//  Created by Yolima Pereira Ruiz on 20/11/24.
//

import SwiftUI

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
