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
    return  a / b;
}

+ (double)sine:(double)value {
   
    double radians = value * M_PI / 180.0;
    double result =  sin(radians);
    if (fabs(result) < 1e-10) {
        result = 0.0;
    }
    return result;
}

+ (double)cosine:(double)value {
    
    double radians = value * M_PI / 180.0;
    double result = cos(radians);
    
    if (fabs(result) < 1e-10) {
        result = 0.0;
    }
    return result;
}

+ (double)tangent:(double)value {
    // converts degrees to radians
    double radians = value * M_PI / 180.0;
    NSLog(@"DEBUG: Calculando tangente. Grados: %f, Radianes: %f", value, radians);

    // verifies if cos is near to 0
    double cosine = cos(radians);
    if (fabs(cosine) < 1e-10) {
        NSLog(@"DEBUG: Tangente indefinida para %f grados (cos = %f)", value, cosine);
        return NAN; // not a number
    }

    return tan(radians);
}

@end
