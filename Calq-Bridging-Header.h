//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <Foundation/Foundation.h>

@interface CalculatorCore : NSObject

+ (double)add:(double)a with:(double)b;
+ (double)subtract:(double)a with:(double)b;
+ (double)multiply:(double)a with:(double)b;
+ (double)divide:(double)a by:(double)b;
+ (double)sine:(double)value;
+ (double)cosine:(double)value;
+ (double)tangent:(double)value;

@end
