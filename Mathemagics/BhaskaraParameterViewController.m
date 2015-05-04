//
//  ParameterViewController.m
//  Mathemagics
//
//  Created by Leon Berni on 4/14/15.
//  Copyright (c) 2015 Leon Berni & Gabriel Nopper. All rights reserved.
//

#import "BhaskaraParameterViewController.h"
#import "ReceiveEquation.h"

@interface BhaskaraParameterViewController ()

@end

@implementation BhaskaraParameterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numberTypeData = @[@"Naturais", @"Inteiros", @"Reais"];
    
    self.parameterPicker.dataSource = self;
    self.parameterPicker.delegate = self;    
    
    self.sliderValue.text = [NSString stringWithFormat:@"%.2f",self.sliderDesu.value*10];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.numberTypeData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.numberTypeData[row];
}

- (IBAction)sliderComplexity:(id)sender {
    UISlider *senderSlider = sender;
    self.sliderValue.text = [NSString stringWithFormat:@"%.2f",senderSlider.value*10];
    
}
#pragma mark - Navigation

-(IBAction)unwindToBhaskhara:(UIStoryboardSegue*)unwindSegue{
    
}

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
    equationToBeSent.formulas = @[@"x = -b±√∆/ 2.a", @"∆ = bˆ2 - 4.a.c"];
    equationToBeSent.phases = @[@"To", @"Be", @"Announced"];
    if(![Bhaskara getBhaskaraToArray:equationToBeSent.parts anwser:(int)equationToBeSent.answerType complexity:equationToBeSent.complexity])
        return;
    
    if ([[segue destinationViewController] conformsToProtocol:@protocol(ReceiveEquation)]) {
        [[segue destinationViewController] setEquation:equationToBeSent];
    }
}

- (IBAction)backToRootView:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


@end
