//
//  FirstGrade.m
//  Metodos Obj-C
//
//  Created by Gabriel Nopper on 16/04/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "FirstGrade.h"

@implementation FirstGrade

-(void)generateEquation{
    Fraction *x1, *a, *b;
    x1 = [[Fraction alloc] init];
    a = [[Fraction alloc] init];
    b = [[Fraction alloc] init];

    [x1 setTo:(arc4random() % 50 - 25) over:arc4random() % 5 + 1];
    [a setTo:(arc4random() % 5 + 1) over:1];
    [b setTo:(arc4random() % 50 - 25) over:arc4random() % 5 + 1];
    
    [x1 reduce];
    [x1 print];
    Fraction *temp, *res;
    
    temp = [[Fraction alloc] initWithFraction:x1];
    [temp multiply:a];
    res = [[Fraction alloc] initWithFraction:temp];
    
    [res add:b];
    
    NSLog(@"%d/%dx + %d/%d= %d/%d", [a.numerator intValue], [a.denominator intValue], [b.numerator intValue], [b.denominator intValue], [res.numerator intValue], [res.denominator intValue]);    
}

+(int)getFirstGradeToArray: (NSMutableArray*) array anwser:(int)xValueDominium complexity:(NSNumber*)complexity{
    
    Fraction *x1, *a, *b;
    
    x1 = [[Fraction alloc] init];
    a = [[Fraction alloc] init];
    b = [[Fraction alloc] init];
    
    float temp1 = (float)10 * [complexity floatValue];
    int denominatorMultiplier = temp1;
    if(xValueDominium < 2)
        denominatorMultiplier = 0;
    int numeratorMultiplier = 20*temp1;
    int subtractor = numeratorMultiplier/2;
    if(xValueDominium < 1){
        numeratorMultiplier /= 2;
        subtractor = 0;
    }
    
    if(denominatorMultiplier){
        [x1 setTo:(arc4random() % numeratorMultiplier - subtractor) over:arc4random() % denominatorMultiplier + 1];
        [a setTo:(arc4random() % ((int)temp1 + 1)) over:1];
        [b setTo:(arc4random() % numeratorMultiplier - subtractor) over:arc4random() % denominatorMultiplier + 1];
    }
    else{
        [x1 setTo:(arc4random() % numeratorMultiplier - subtractor) over:1];
        [a setTo:(arc4random() % ((int)temp1 + 1)) over:1];
        [b setTo:(arc4random() % numeratorMultiplier - subtractor) over:1];
    }
    
    
    [x1 reduce];
    [x1 print];
    Fraction *temp, *res;
    
    temp = [[Fraction alloc] initWithFraction:x1];
    [temp multiply:a];
    res = [[Fraction alloc] initWithFraction:temp];
    
    [res add:b];
    
    
    [array addObject:[NSString stringWithFormat:@"%d", [a getNumerator]]];
    [array addObject:[NSString stringWithFormat:@"%d", [a getDenominator]]];
    [array addObject:[NSString stringWithFormat:@"%d", [b getNumerator]]];
    [array addObject:[NSString stringWithFormat:@"%d", [b getDenominator]]];
    [array addObject:[NSString stringWithFormat:@"%d", [res getNumerator]]];
    [array addObject:[NSString stringWithFormat:@"%d", [res getDenominator]]];
    [array addObject:[NSString stringWithFormat:@"%d", [x1 getNumerator]]];
    [array addObject:[NSString stringWithFormat:@"%d", [x1 getDenominator]]];
    return 1;
}


@end
