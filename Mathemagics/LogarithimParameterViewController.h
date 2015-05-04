//
//  LogarithimParameterViewController.h
//  Mathemagics
//
//  Created by Leon Berni on 4/15/15.
//  Copyright (c) 2015 Leon Berni & Gabriel Nopper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EquationInfos.h"
#import "Logarithm.h"
@interface LogarithimParameterViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UISlider *sliderDesu;
@property (weak, nonatomic) IBOutlet UILabel *sliderValue;
@property (weak, nonatomic) IBOutlet UILabel *eqName;

@end
