//
//  Fraction.m
//  Metodos Obj-C
//
//  Created by Gabriel Nopper on 08/04/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

/**
 Prints the fraction value in num/dem format.
 **/
-(void) print
{
    int n, d;
    n = [self.numerator intValue];
    d = [self.denominator intValue];
    NSLog(@"%d/%d", n, d);
    
}

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

/**
    Instances a new Fraction with Numerator and Denominator.
 **/
- (instancetype)initWithNumerator:(int)numerator denominator:(int)denominator {

    self = [super init];
    if (self) {
        _numerator = [NSNumber numberWithInt:numerator];
        _denominator = [NSNumber numberWithInt:denominator];
    }
    return self;
}
/**
    Instances a new fraction with a given fraction, mirroring it's values.
 **/
- (instancetype)initWithFraction:(Fraction*) fraction{
    
    self = [super init];
    if (self) {
        _numerator = [NSNumber numberWithInt:[fraction getNumerator]];
        _denominator = [NSNumber numberWithInt:[fraction getDenominator]];
    }
    return self;
}

/**
 Sets the Fraction numerator to n.
 **/
-(void) setNumeratorWithInt: (int) n
{
    self.numerator = [NSNumber numberWithInt:n];
}

/**
 Fetches the Fraction numerator as a Int value.
 **/
-(int) getNumerator
{
    return [self.numerator intValue];
}

/**
 Sets the Fraction denominator to d.
 **/
-(void) setDenominatorWithInt: (int) d
{
    self.denominator = [NSNumber numberWithInt:d];
}

/**
 Fetches the Fraction denominator as a Int value.
 **/
-(int) getDenominator
{
    return [self.denominator intValue];
}

/**
 Sets the Fraction numerator to n, and denominator do d.
 **/
-(void) setTo: (int) n over: (int) d
{
    self.numerator = [NSNumber numberWithInt:n];
    self.denominator = [NSNumber numberWithInt:d];
}

/**
 Converts the fraction value into a floating point double value. Mind that this process is hardly reversible, and will often offer precision loss due to floating point approximation.
 **/
-(double) convertToDouble
{
    if (self.denominator) return [self.numerator doubleValue] / [self.denominator intValue];
    else return NAN;
}

/**
 Adds to this Fraction another one.
 **/
-(void) add: (Fraction*) f
{
    
    self.numerator = [NSNumber numberWithInt:[self.numerator intValue] * [f.denominator intValue] + [self.denominator intValue] * [f.numerator intValue]];
    
    self.denominator = [NSNumber numberWithInt:[self.denominator intValue] * [f.denominator intValue]];
    
    [self reduce];
}
/**
 Subtracts tO this Fraction another one.
 **/
-(void) subtract: (Fraction*) f
{
    self.numerator = [NSNumber numberWithInt:[self.numerator intValue] * [f.denominator intValue] - [self.denominator intValue] * [f.numerator intValue]];
    self.denominator = [NSNumber numberWithInt:[self.denominator intValue] * [f.denominator intValue]];
    
    [self reduce];
}

/**
 Multiplies this Fraction with another one. The result is only applied on this one.
 **/
-(void) multiply: (Fraction *) f
{
    self.numerator = [NSNumber numberWithInt:[self.numerator intValue] * [f.numerator intValue]];
    self.denominator = [NSNumber numberWithInt:[self.denominator intValue] * [f.denominator intValue]];
    
    [self reduce];
}
/**
 Divides this Fraction with another one. The result is only applied on this one.
 **/
-(void) divide: (Fraction *) f
{
    self.numerator = [NSNumber numberWithInt:[self.numerator intValue] * [f.denominator intValue]];
    self.denominator = [NSNumber numberWithInt:[self.denominator intValue] * [f.numerator intValue]];
    
    [self reduce];
}

/**
 Reduces this Fraction to the simplest form available.
 **/
-(void) reduce
{
    int u = [self.numerator intValue];
    int v = [self.denominator intValue];
    int temp;
    
    while (v)
    {
        temp = u % v;
        u = v;
        v = temp;
    }
    int n = [self.numerator intValue];
    self.numerator =  [NSNumber numberWithInt:(n / u)];
    self.denominator = [NSNumber numberWithInt:([self.denominator intValue] / u)];
}

// Internal use only. This calculates the greatest commom multiple.
+(int)gcd:(int) m and:(int) n{
    int tmp;
    while(m) { tmp = m; m = n % m; n = tmp; }
    return n;
}
// Internal use only. This calculates the least commom multiple, or Mininum commom multiply.
+(int)mmc:(int) m and:(int) n
{
    return m / [self gcd:m and:n] * n;
}

/**
 This method finds the least commom multiple between two given Fractions, and transform them into same-base numbers. This effect is applied on both Fractions.
 **/
+(void)applyMMC:(Fraction*)frac1 Fraction2:(Fraction*) frac2{
    int m = [frac1.denominator intValue];
    int n = [frac2.denominator intValue];
    int mmc = [self mmc:m and:n];
    NSLog(@"MMC = %d", mmc);
    int num1 = [frac1.numerator intValue];
    num1 = num1 * mmc / m;
    [frac1 setTo:num1 over:mmc];
    
    int num2 = [frac2.numerator intValue];
    num2 = num2 * mmc / n;
    [frac2 setTo:num2 over:mmc];
    
}


@end