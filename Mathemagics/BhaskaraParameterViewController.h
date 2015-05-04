//
//  ParameterViewController.h
//  Mathemagics
//
//  Created by Leon Berni on 4/14/15.
//  Copyright (c) 2015 Leon Berni & Gabriel Nopper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EquationInfos.h"
#import "Bhaskara.h"
@interface BhaskaraParameterViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *parameterPicker;
@property NSArray *numberTypeData;
@property (weak, nonatomic) IBOutlet UILabel *sliderValue;
@property (weak, nonatomic) IBOutlet UISlider *sliderDesu;
@property (weak, nonatomic) IBOutlet UILabel *eqName;

@end
