//
//  FirstDegreeParameterViewController.m
//  Mathemagics
//
//  Created by Leon Berni on 4/15/15.
//  Copyright (c) 2015 Leon Berni & Gabriel Nopper. All rights reserved.
//

#import "FirstDegreeParameterViewController.h"
#import "ReceiveEquation.h"

@interface FirstDegreeParameterViewController ()

@end

@implementation FirstDegreeParameterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numberTypeData = @[@"Naturais", @"Inteiros", @"Reais"];
    
    self.parameterPicker.dataSource = self;
    self.parameterPicker.delegate = self;
    
    
    self.sliderValue.text = [NSString stringWithFormat:@"%.2f",self.sliderDesu.value*10];
    


    // Do any additional setup after loading the view.
}

-(IBAction)unwindToFirstD:(UIStoryboardSegue*)unwindSegue{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.numberTypeData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.numberTypeData[row];
}

- (IBAction)sliderComplexity:(id)sender {
    self.sliderValue.text = [NSString stringWithFormat:@"%.2f",self.sliderDesu.value*10];
    
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //     Get the new view controller using [segue destinationViewController].
    //     Pass the selected object to the new view controller.
    EquationInfos* equationToBeSent = [[EquationInfos alloc] init];
    NSNumber *complexity = [[NSNumber alloc] initWithFloat:self.sliderDesu.value];
    equationToBeSent.answerType = [self.parameterPicker selectedRowInComponent:0];
    equationToBeSent.complexity = complexity;
    equationToBeSent.parts = [[NSMutableArray alloc] init];
    equationToBeSent.equationName = [NSString stringWithFormat:@"%ld", self.eqName.tag];
    equationToBeSent.formulas = @[@"ax+b = 0"];
    equationToBeSent.phases = @[@"ax+b = 0", @"ax = -b", @"x = -b/a"];
    if(![FirstGrade getFirstGradeToArray:equationToBeSent.parts anwser:(int)equationToBeSent.answerType complexity:equationToBeSent.complexity])
        return;
    
    if ([[segue destinationViewController] conformsToProtocol:@protocol(ReceiveEquation)]) {
        [[segue destinationViewController] setEquation:equationToBeSent];
    }

    
}
- (IBAction)backToRootView:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}



@end
