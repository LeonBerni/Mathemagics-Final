//
//  Logarithm.m
//  Metodos Obj-C
//
//  Created by Gabriel Nopper on 16/04/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import "Logarithm.h"
#import "Fraction.h"

@implementation Logarithm

-(void)generateLogarithm{
    
    int x, y, n;
    x = arc4random() % 10 + 1;
    y = arc4random() % 5 + 1;
    
    n = pow(x, y);
    
    NSLog(@"log %d (%d) = %d", x, n, y);
}

+(int)getLogToArray: (NSMutableArray*) array complexity:(NSNumber*)complexity{
    
    int x, y, n;
    x = arc4random() % 10 + 1;
    y = arc4random() % 5 + 1;
    
    n = pow(x, y);
    
    [array addObject:[NSString stringWithFormat:@"%d", n]];
    [array addObject:[NSString stringWithFormat:@"%d", x]];
    [array addObject:[NSString stringWithFormat:@"%d", y]];

    
    return 1;
}


@end
