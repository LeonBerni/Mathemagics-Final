//
//  Bhaskara.h
//  Metodos Obj-C
//
//  Created by Gabriel Nopper on 08/04/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bhaskara : NSObject


-(void)generateBhaskhara;
+(int)getBhaskaraToArray: (NSMutableArray*) array anwser:(int)xValueDominium complexity:(NSNumber*)complexity;

@end
