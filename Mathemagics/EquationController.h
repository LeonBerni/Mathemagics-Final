//
//  EquationController.h
//  Mathemagics
//
//  Created by Leon Berni on 4/17/15.
//  Copyright (c) 2015 Leon Berni & Gabriel Nopper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReceiveEquation.h"
#import "EquationInfos.h"

@interface EquationController : UIViewController <ReceiveEquation>

@property EquationInfos* receivedEquation;
@property UILabel* answer1;
@property UILabel* answer2;
@property UILabel* answer3;
@property UILabel* answer4;
@property UILabel* deAnswer1;
@property UILabel* deAnswer2;
@property UILabel* deAnswer3;
@property UILabel* deAnswer4;
@property UILabel* answer5;

@end
