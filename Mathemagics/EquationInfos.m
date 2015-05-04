//
//  EquationInfos.m
//  Mathemagics
//
//  Created by Leon Berni on 4/17/15.
//  Copyright (c) 2015 Leon Berni & Gabriel Nopper. All rights reserved.
//

#import "EquationInfos.h"

@implementation EquationInfos

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.phases = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
