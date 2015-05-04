//
//  ReceiveEquation.h
//  Mathemagics
//
//  Created by Leon Berni on 4/17/15.
//  Copyright (c) 2015 Leon Berni & Gabriel Nopper. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "EquationInfos.h"

@protocol ReceiveEquation <NSObject>

- (void) setEquation:(EquationInfos*) equation;

@end
