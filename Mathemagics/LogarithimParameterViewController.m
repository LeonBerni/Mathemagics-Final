//
//  LogarithimParameterViewController.m
//  Mathemagics
//
//  Created by Leon Berni on 4/15/15.
//  Copyright (c) 2015 Leon Berni & Gabriel Nopper. All rights reserved.
//

#import "LogarithimParameterViewController.h"
#import "ReceiveEquation.h"

@interface LogarithimParameterViewController ()

@end

@implementation LogarithimParameterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sliderValue.text = [NSString stringWithFormat:@"%.0f",self.sliderDesu.value*10];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)unwindToLog:(UIStoryboardSegue*)unwindSegue{
    
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    EquationInfos* equationToBeSent = [[EquationInfos alloc] init];
    NSNumber *complexity = [[NSNumber alloc] initWithFloat:self.sliderDesu.value];
    equationToBeSent.complexity = complexity;
    equationToBeSent.parts = [[NSMutableArray alloc] init];
    equationToBeSent.equationName = [NSString stringWithFormat:@"%ld", self.eqName.tag];
    equationToBeSent.formulas = @[@"a^x = b <=> log aˆb = x"];
    equationToBeSent.phases = @[@"To", @"Be", @"Announced"];
    if(![Logarithm getLogToArray:equationToBeSent.parts complexity:equationToBeSent.complexity])
        return;
    
    if ([[segue destinationViewController] conformsToProtocol:@protocol(ReceiveEquation)]) {
        [[segue destinationViewController] setEquation:equationToBeSent];
    }
}

- (IBAction)sliderComplexity:(id)sender {
    self.sliderValue.text = [NSString stringWithFormat:@"%.0f",self.sliderDesu.value*10];
    
}

- (IBAction)backToRootView:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
