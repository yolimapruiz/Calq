//
//  calculatorCore.m
//  Calq
//
//  Created by Yolima Pereira Ruiz on 19/11/24.
//

#import <Foundation/Foundation.h>
#import "Calq-Bridging-Header.h"

@implementation CalculatorCore

+ (double)add:(double)a with:(double)b {
    return a + b;
}

+ (double)subtract:(double)a with:(double)b {
    return a - b;
}

+ (double)multiply:(double)a with:(double)b {
    return a * b;
}

+ (double)divide:(double)a by:(double)b {
    return b != 0 ? a / b : NAN; // Handle division by zero
}

+ (double)sine:(double)value {
    return sin(value);
}

+ (double)cosine:(double)value {
    return cos(value);
}

+ (double)tangent:(double)value {
    return tan(value);
}

@end
