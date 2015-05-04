//
//  Fatoracao.m
//  Metodos Obj-C
//
//  Created by Gabriel Nopper on 16/04/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "Fatoracao.h"
#import "Fraction.h"

@implementation Fatoracao

-(void)generateFatorComum{
    
    Fraction *x, *y, *a;
    x = [[Fraction alloc] init];
    y = [[Fraction alloc] init];
    a = [[Fraction alloc] init];
    
    [x setTo:(arc4random() % 50 - 25) over:arc4random() % 5 + 1];
    [y setTo:(arc4random() % 50 - 25) over:arc4random() % 5 + 1];
    [a setTo:(arc4random() % 50 - 25) over:arc4random() % 5 + 1];
    
    Fraction *res1, *res2;
    res1 = [[Fraction alloc] initWithFraction:x];
    res2 = [[Fraction alloc] initWithFraction:y];
    
    [res1 multiply:a];
    [res2 multiply:a];
    
    NSLog(@"%d/%d x + %d/%d y = 0", [res1.numerator intValue], [res1.denominator intValue], [res2.numerator intValue], [res2.denominator intValue]);
}

-(void)generateAgrupamento{
    
    Fraction *x, *y, *a, *b, *c;
    
    x = [[Fraction alloc] init];
    y = [[Fraction alloc] init];
    a = [[Fraction alloc] init];
    b = [[Fraction alloc] init];
    c = [[Fraction alloc] init];
    
    [x setTo:(arc4random() % 50 - 25) over:arc4random() % 5 + 1];
    [y setTo:(arc4random() % 50 - 25) over:arc4random() % 5 + 1];
    [a setTo:(arc4random() % 50 - 25) over:arc4random() % 5 + 1];
    [b setTo:(arc4random() % 50 - 25) over:arc4random() % 5 + 1];
    [c setTo:(arc4random() % 50 - 25) over:arc4random() % 5 + 1];

    Fraction *temp1, *temp2, *temp3, *temp4;
    
    temp1 = [[Fraction alloc] initWithFraction:x];
    [temp1 multiply:y];
    
    temp2 = [[Fraction alloc] initWithFraction:x];
    [temp2 multiply:b];
    
    temp3 = [[Fraction alloc] initWithFraction:a];
    [temp3 multiply:y];
    
    temp4 = [[Fraction alloc] initWithFraction:a];
    [temp4 multiply:b];
    
    NSLog(@"(%d/%d x + %d/%d)*(%d/%d y + %d/%d) = %d/%d + %d/%d + %d/%d + %d/%d", [x.numerator intValue], [x.denominator intValue], [a.numerator intValue], [a.denominator intValue], [y.numerator intValue], [y.denominator intValue], [b.numerator intValue], [b.denominator intValue], [temp1.numerator intValue], [temp1.denominator intValue], [temp2.numerator intValue], [temp2.denominator intValue], [temp3.numerator intValue], [temp3.denominator intValue], [temp4.numerator intValue], [temp4.denominator intValue]);
}

-(void)generateTrinomio{
    
    Fraction *x, *y;
    x = [[Fraction alloc] init];
    y = [[Fraction alloc] init];
    
    [x setTo:(arc4random() % 50 - 25) over:arc4random() % 5 + 1];
    [y setTo:(arc4random() % 50 - 25) over:arc4random() % 5 + 1];

    BOOL inversion = arc4random() % 2;
    
    
    
    Fraction *res1, *res2, *res3;
    res1 = [[Fraction alloc] initWithFraction:x];
    [res1 multiply:x];
    res3 = [[Fraction alloc] initWithFraction:y];
    [res3 multiply:y];

    if(!inversion){
        res2 = [[Fraction alloc] initWithFraction:x];
        [res2 multiply:y];
        [res2 setNumeratorWithInt:( 2 * [res2.numerator intValue])];
    }
    
    
    if(!inversion)
        NSLog(@"%d/%d x^2 + %d/%d x + %d/%d = 0", [res1.numerator intValue], [res1.denominator intValue], [res2.numerator intValue], [res2.denominator intValue], [res3.numerator intValue], [res3.denominator intValue]);
    else
        NSLog(@"%d/%d x^2 - %d/%d = 0", [res1.numerator intValue], [res1.denominator intValue], [res3.numerator intValue], [res3.denominator intValue]);
}


/* TO ARRAY */

+(int)getAnyFatorToArray:(NSMutableArray*)Array type:(NSInteger)type dominium:(int)xDominium complexity:(NSNumber*)complexity{
    
    //int temp = 10 * [complexity floatValue];
    int rand = 0;
    if(type != 0)
        rand = arc4random() % type;
    
    if(type > 0){
        if(rand == 0)
            rand = arc4random() % type;
        if(type > 1)
            if(rand < 2)
                rand = arc4random() % type;
    }
    

    switch (type) {
        case 0:
            if([self getFatorComumToArray:Array dominium:xDominium complexity:complexity]){
                [Array addObject:[NSNumber numberWithInt:0]];
                return 1;
            }
            break;
        case 1:
            if([self getAgrupamentoToArray:Array dominium:xDominium complexity:complexity]){
                [Array addObject:[NSNumber numberWithInt:1]];
                return 1;
            }
            break;
        case 2:
            if([self getTrinomioToArray:Array dominium:xDominium complexity:complexity]){
                [Array addObject:[NSNumber numberWithInt:2]];
                return 1;
            }
            break;
            
        default:
            
            break;
    }
    return 0;
}

+(int)getFatorComumToArray:(NSMutableArray*)Array dominium:(int)xDominium complexity:(NSNumber*)complexity{
    
    float temp = (float)10 * [complexity floatValue];
    int denominatorMultiplier = temp;
    if(xDominium < 2)
        denominatorMultiplier = 0;
    int numeratorMultiplier = 20*temp;
    int subtractor = numeratorMultiplier/2;
    if(xDominium < 1){
        numeratorMultiplier /= 2;
        subtractor = 0;
    }
    
    Fraction *x, *y, *a;
    x = [[Fraction alloc] init];
    y = [[Fraction alloc] init];
    a = [[Fraction alloc] init];
    if(denominatorMultiplier){
        [x setTo:(arc4random() % numeratorMultiplier - subtractor) over:arc4random() % denominatorMultiplier + 1];
        [y setTo:(arc4random() % numeratorMultiplier - subtractor) over:arc4random() % denominatorMultiplier + 1];
        [a setTo:(arc4random() % numeratorMultiplier - subtractor) over:arc4random() % denominatorMultiplier + 1];
    }
    else{
        [x setTo:(arc4random() % numeratorMultiplier - subtractor) over:1];
        [y setTo:(arc4random() % numeratorMultiplier - subtractor) over:1];
        [a setTo:(arc4random() % numeratorMultiplier - subtractor) over:1];
    }
    
    Fraction *res1, *res2;
    res1 = [[Fraction alloc] initWithFraction:x];
    res2 = [[Fraction alloc] initWithFraction:y];
    
    [res1 multiply:a];
    [res2 multiply:a];
    
    
    [Array addObject:[NSString stringWithFormat:@"%dx", [res1 getNumerator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [res1 getDenominator]]];
    [Array addObject:[NSString stringWithFormat:@"%dy", [res2 getNumerator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [res2 getDenominator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [x getNumerator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [x getDenominator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [y getNumerator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [y getDenominator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [a getNumerator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [a getDenominator]]];
    
    return 1;
}

+(int)getAgrupamentoToArray:(NSMutableArray*)Array dominium:(int)xDominium complexity:(NSNumber*)complexity{
    
    float temp = (float)10 * [complexity floatValue];
    int denominatorMultiplier = temp;
    if(xDominium < 2)
        denominatorMultiplier = 0;
    int numeratorMultiplier = 20*temp;
    int subtractor = numeratorMultiplier/2;
    if(xDominium < 1){
        numeratorMultiplier /= 2;
        subtractor = 0;
    }
    
    Fraction *x, *y, *a, *b, *c;
    if(denominatorMultiplier){
        x = [[Fraction alloc] initWithNumerator:(arc4random() % numeratorMultiplier - subtractor) denominator:arc4random() % denominatorMultiplier + 1];
        y = [[Fraction alloc] initWithNumerator:(arc4random() % numeratorMultiplier - subtractor) denominator:arc4random() % denominatorMultiplier + 1];
        a = [[Fraction alloc] initWithNumerator:(arc4random() % numeratorMultiplier - subtractor) denominator:arc4random() % denominatorMultiplier + 1];
        b = [[Fraction alloc] initWithNumerator:(arc4random() % numeratorMultiplier - subtractor) denominator:arc4random() % denominatorMultiplier + 1];
        c = [[Fraction alloc] initWithNumerator:(arc4random() % numeratorMultiplier - subtractor) denominator:arc4random() % denominatorMultiplier + 1];

    }
    else{
        x = [[Fraction alloc] initWithNumerator:(arc4random() % numeratorMultiplier - subtractor) denominator:1];
        y = [[Fraction alloc] initWithNumerator:(arc4random() % numeratorMultiplier - subtractor) denominator:1];
        a = [[Fraction alloc] initWithNumerator:(arc4random() % numeratorMultiplier - subtractor) denominator:1];
        b = [[Fraction alloc] initWithNumerator:(arc4random() % numeratorMultiplier - subtractor) denominator:1];
        c = [[Fraction alloc] initWithNumerator:(arc4random() % numeratorMultiplier - subtractor) denominator:1];

    }
    
    
    Fraction *temp1, *temp2, *temp3, *temp4;
    
    temp1 = [[Fraction alloc] initWithFraction:x];
    [temp1 multiply:y];
    
    temp2 = [[Fraction alloc] initWithFraction:x];
    [temp2 multiply:b];
    
    temp3 = [[Fraction alloc] initWithFraction:a];
    [temp3 multiply:y];
    
    temp4 = [[Fraction alloc] initWithFraction:a];
    [temp4 multiply:b];
    
    [Array addObject:[NSString stringWithFormat:@"%dxy", [temp1 getNumerator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [temp1 getDenominator]]];
    [Array addObject:[NSString stringWithFormat:@"%dx", [temp2 getNumerator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [temp2 getDenominator]]];
    [Array addObject:[NSString stringWithFormat:@"%dy", [temp3 getNumerator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [temp3 getDenominator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [temp4 getNumerator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [temp4 getDenominator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [x getNumerator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [x getDenominator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [a getNumerator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [a getDenominator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [y getNumerator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [y getDenominator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [b getNumerator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [b getDenominator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [c getNumerator]]];
    [Array addObject:[NSString stringWithFormat:@"%d", [c getDenominator]]];
    
    return 1;
}

+(int)getTrinomioToArray:(NSMutableArray*)Array dominium:(int)xDominium complexity:(NSNumber*)complexity{
    
    float temp = (float)10 * [complexity floatValue];
    int denominatorMultiplier = temp;
    if(xDominium < 2)
        denominatorMultiplier = 0;
    int numeratorMultiplier = 20*temp;
    int subtractor = numeratorMultiplier/2;
    if(xDominium < 1){
        numeratorMultiplier /= 2;
        subtractor = 0;
    }
    
    Fraction *x, *y;
    x = [[Fraction alloc] init];
    y = [[Fraction alloc] init];
    if(denominatorMultiplier){
        [x setTo:(arc4random() % numeratorMultiplier - subtractor) over:arc4random() % denominatorMultiplier + 1];
        [y setTo:(arc4random() % numeratorMultiplier - subtractor) over:arc4random() % denominatorMultiplier + 1];
    }
    else{
        [x setTo:(arc4random() % numeratorMultiplier - subtractor) over:1];
        [y setTo:(arc4random() % numeratorMultiplier - subtractor) over:1];
    }
    
    
    BOOL inversion = arc4random() % 2;
    
    
    
    Fraction *res1, *res2, *res3;
    res1 = [[Fraction alloc] initWithFraction:x];
    [res1 multiply:x];
    res3 = [[Fraction alloc] initWithFraction:y];
    [res3 multiply:y];
    
    if(!inversion){
        res2 = [[Fraction alloc] initWithFraction:x];
        [res2 multiply:y];
        [res2 setNumeratorWithInt:( 2 * [res2.numerator intValue])];
    }
    
    
    if(!inversion){
        NSLog(@"%d/%d x^2 + %d/%d x + %d/%d = 0", [res1.numerator intValue], [res1.denominator intValue], [res2.numerator intValue], [res2.denominator intValue], [res3.numerator intValue], [res3.denominator intValue]);
        [Array addObject:[NSString stringWithFormat:@"%d", [res1 getNumerator]]];
        [Array addObject:[NSString stringWithFormat:@"%d", [res1 getDenominator]]];
        [Array addObject:[NSString stringWithFormat:@"%d", [res2 getNumerator]]];
        [Array addObject:[NSString stringWithFormat:@"%d", [res2 getDenominator]]];
        [Array addObject:[NSString stringWithFormat:@"%d", [res3 getNumerator]]];
        [Array addObject:[NSString stringWithFormat:@"%d", [res3 getDenominator]]];
        [Array addObject:[NSString stringWithFormat:@"%d", [x getNumerator]]];
        [Array addObject:[NSString stringWithFormat:@"%d", [x getDenominator]]];
        [Array addObject:[NSString stringWithFormat:@"%d", [y getNumerator]]];
        [Array addObject:[NSString stringWithFormat:@"%d", [y getDenominator]]];
        

    }
    else{
        NSLog(@"%d/%d x^2 - %d/%d = 0", [res1.numerator intValue], [res1.denominator intValue], [res3.numerator intValue], [res3.denominator intValue]);
        [res3 setNumeratorWithInt:-([res3.numerator intValue])];
        [Array addObject:[NSString stringWithFormat:@"%d", [res1 getNumerator]]];
        [Array addObject:[NSString stringWithFormat:@"%d", [res1 getDenominator]]];
        [Array addObject:@"0"];
        [Array addObject:@"1"];
        [Array addObject:[NSString stringWithFormat:@"%d", [res3 getNumerator]]];
        [Array addObject:[NSString stringWithFormat:@"%d", [res3 getDenominator]]];
        [Array addObject:[NSString stringWithFormat:@"%d", [x getNumerator]]];
        [Array addObject:[NSString stringWithFormat:@"%d", [x getDenominator]]];
        [Array addObject:[NSString stringWithFormat:@"%d", [y getNumerator]]];
        [Array addObject:[NSString stringWithFormat:@"%d", [y getDenominator]]];
    }
    
    return 1;
}


@end
