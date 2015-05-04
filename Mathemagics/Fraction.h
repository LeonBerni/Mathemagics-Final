//
//  AppDelegate.h
//  Metodos Obj-C
//
//  Created by Gabriel Nopper on 08/04/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 This class is a symbolic math class. It treats a number as a Fraction, with integer numerator and denominators, allowing you to calculate without floating point imprecision while spending more on size.
 While this is usually limited due to small number limits, this class provides a useful Math-type to handle input calculations like Wolfram, and for most math study purpuses.
 The class also provides getters and setters, efficient calculation methods, conversion to double, reducing and applying least common multiple.
 **/
@interface Fraction : NSObject

@property NSNumber *numerator, *denominator;

//Class Methods
-(void) print;
-(instancetype)initWithNumerator:(int)numerator denominator:(int)denominator;
-(instancetype)initWithFraction:(Fraction*) fraction;
-(void) setNumeratorWithInt: (int) n;
-(int) getNumerator;
-(void) setDenominatorWithInt: (int) d;
-(int) getDenominator;
-(void) setTo: (int) n over: (int) d;
-(double) convertToDouble;
-(void) add: (Fraction*) f;
-(void) subtract: (Fraction*) f;
-(void) multiply: (Fraction*) f;
-(void) divide: (Fraction *) f;
-(void) reduce;

//Static Methods
+(void)applyMMC:(Fraction*)frac1 Fraction2:(Fraction*) frac2;

@end