//
//  FirstGrade.h
//  Metodos Obj-C
//
//  Created by Gabriel Nopper on 16/04/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface FirstGrade : NSObject

-(void)generateEquation;
+(int)getFirstGradeToArray: (NSMutableArray*) array anwser:(int)xValueDominium complexity:(NSNumber*)complexity;

@end
