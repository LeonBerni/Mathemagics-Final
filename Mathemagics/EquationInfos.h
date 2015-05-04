//
//  EquationInfos.h
//  Mathemagics
//
//  Created by Leon Berni on 4/17/15.
//  Copyright (c) 2015 Leon Berni & Gabriel Nopper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EquationInfos : NSObject


@property (retain, strong) NSString *equationName;
@property NSArray* phases;
@property NSInteger inputType;
@property NSString* testeDes;
@property NSInteger answerType;
@property NSNumber* complexity;
@property NSArray* formulas;
@property NSMutableArray* parts;

@end
