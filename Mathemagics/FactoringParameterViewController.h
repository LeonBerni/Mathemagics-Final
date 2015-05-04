//
//  FactoringParameterViewController.h
//  Mathemagics
//
//  Created by Leon Berni on 4/15/15.
//  Copyright (c) 2015 Leon Berni & Gabriel Nopper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EquationInfos.h"
#import "Fatoracao.h"
@interface FactoringParameterViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *parameterPicker;
@property (weak, nonatomic) IBOutlet UISlider *sliderDesu;
@property (weak, nonatomic) IBOutlet UILabel *sliderValue;
@property NSArray* numberTypeData;
@property NSArray* numberTypeData2;
@property (weak, nonatomic) IBOutlet UILabel *eqName;

@end
