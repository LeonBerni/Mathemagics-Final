//
//  EquationController.m
//  Mathemagics
//
//  Created by Leon Berni on 4/17/15.
//  Copyright (c) 2015 Leon Berni & Gabriel Nopper. All rights reserved.
//

#import "EquationController.h"

@interface EquationController ()

@end

@implementation EquationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    int teste = self.view.frame.size.width/6;
    self.answer1 = [[UILabel alloc] initWithFrame:CGRectMake(teste-50 + 10, 314, 100, 21)];
//    [self.answer1 sizeToFit];
    self.answer1.textAlignment = NSTextAlignmentCenter;
    [self.answer1 setHidden:YES];
    [self.view addSubview:self.answer1];
    
    self.deAnswer1 = [[UILabel alloc] initWithFrame:CGRectMake(teste-50 + 10, 334, 100, 21)];
//    [self.deAnswer1 sizeToFit];
    self.deAnswer1.textAlignment = NSTextAlignmentCenter;
    [self.deAnswer1 setHidden:YES];
    [self.view addSubview:self.deAnswer1];
    
    self.answer2 = [[UILabel alloc] initWithFrame:CGRectMake(teste*2-50, 314, 100, 21)];
  //  [self.answer2 sizeToFit];
    self.answer2.textAlignment = NSTextAlignmentCenter;
    [self.answer2 setHidden:YES];
    [self.view addSubview:self.answer2];
    
    self.deAnswer2 = [[UILabel alloc] initWithFrame:CGRectMake(teste*2-50 + 10, 334, 100, 21)];
   // [self.deAnswer2 sizeToFit];
    self.deAnswer2.textAlignment = NSTextAlignmentCenter;
    [self.deAnswer2 setHidden:YES];
    [self.view addSubview:self.deAnswer2];
    
    self.answer3 = [[UILabel alloc] initWithFrame:CGRectMake(teste*3-50 + 10, 314, 100, 21)];
//    [self.answer3 sizeToFit];
    self.answer3.textAlignment = NSTextAlignmentCenter;
    [self.answer3 setHidden:YES];
    [self.view addSubview:self.answer3];
    
    self.deAnswer3 = [[UILabel alloc] initWithFrame:CGRectMake(teste*3-50 + 10, 334, 100, 21)];
//    [self.deAnswer3 sizeToFit];
    self.deAnswer3.textAlignment = NSTextAlignmentCenter;
    [self.deAnswer3 setHidden:YES];
    [self.view addSubview:self.deAnswer3];
    
    self.answer4 = [[UILabel alloc] initWithFrame:CGRectMake(teste*4-50 + 10, 314, 100, 21)];
//    [self.answer4 sizeToFit];
    self.answer4.textAlignment = NSTextAlignmentCenter;
    [self.answer4 setHidden:YES];
    [self.view addSubview:self.answer4];
    
    self.deAnswer4 = [[UILabel alloc] initWithFrame:CGRectMake(teste*4-50 + 10, 334, 100, 21)];
//    [self.deAnswer4 sizeToFit];
    self.deAnswer4.textAlignment = NSTextAlignmentCenter;
    [self.deAnswer4 setHidden:YES];
    [self.view addSubview:self.deAnswer4];
    
    self.answer5 = [[UILabel alloc] initWithFrame:CGRectMake(teste*5-50 + 10, 314, 100, 21)];
//    [self.answer5 sizeToFit];
    self.answer5.textAlignment = NSTextAlignmentCenter;
    [self.answer5 setHidden:YES];
    [self.view addSubview:self.answer5];
    
    
    switch ([self.receivedEquation.equationName intValue]) {
        {case 1:
            [self initBhaskara];
            break;
        }
        {case 2:
            [self initFirstD];
            break;
        }
        {case 3:
            [self initLog];
            break;
        }
        {case 4:
            [self initFac];
            break;
        }
        {default:
            //[self initFac];
            break;
        }
    }
}
- (IBAction)goBackToEq:(id)sender {
    switch ([self.receivedEquation.equationName intValue]) {
        case 1:
            [self performSegueWithIdentifier:@"returnToBhaskhara" sender:self];
            break;
        case 2:
            [self performSegueWithIdentifier:@"returnToFirstD" sender:self];
            break;
        case 3:
            [self performSegueWithIdentifier:@"returnToLog" sender:self];
            break;
        case 4:
            [self performSegueWithIdentifier:@"returnToFac" sender:self];
            break;
        default:
            [self performSegueWithIdentifier:@"returnToFac" sender:self];
            break;
    }
    
}
- (IBAction)showAnswer:(id)sender {
    [self.deAnswer1 setHidden:NO];
    [self.deAnswer2 setHidden:NO];
    [self.deAnswer3 setHidden:NO];
    [self.deAnswer4 setHidden:NO];
    [self.answer1 setHidden:NO];
    [self.answer2 setHidden:NO];
    [self.answer3 setHidden:NO];
    [self.answer4 setHidden:NO];
    [self.answer5 setHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setEquation:(EquationInfos *)equation{
    self.receivedEquation = equation;
}

- (void) initBhaskara{
    NSDictionary *underline = @{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)};
    int teste = self.view.frame.size.width/6;

    UILabel* num1 = [[UILabel alloc] initWithFrame:CGRectMake(teste-50 + 10, 40, 100, 21)];
    num1.textAlignment = NSTextAlignmentCenter;
    [num1 setText:[NSString stringWithFormat:@"%@x^2",[self.receivedEquation.parts objectAtIndex:0]]];
    [self.view addSubview:num1];
    UILabel* num2 = [[UILabel alloc] initWithFrame:CGRectMake(teste*2-50 + 25, 40, 100, 21)];
    num2.textAlignment = NSTextAlignmentCenter;
    if ([[self.receivedEquation.parts objectAtIndex:2] intValue] >= 0) {
        [num2 setText:[NSString stringWithFormat:@"+ %@x",[self.receivedEquation.parts objectAtIndex:2]]];
        [self.view addSubview:num2];
    } else{
        [num2 setText:[NSString stringWithFormat:@"%@x",[self.receivedEquation.parts objectAtIndex:2]]];
        [self.view addSubview:num2];
    }
    UILabel* num3 = [[UILabel alloc] initWithFrame:CGRectMake(teste*3-50 + 35, 40, 100, 21)];
    num3.textAlignment = NSTextAlignmentCenter;
    if ([[self.receivedEquation.parts objectAtIndex:4] intValue] >= 0) {
        [num3 setText:[NSString stringWithFormat:@"+ %@",[self.receivedEquation.parts objectAtIndex:4]]];
        [self.view addSubview:num3];
    } else {
        [num3 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:4]]];
        [self.view addSubview:num3];
    }

    UILabel* eqEquals = [[UILabel alloc] initWithFrame:CGRectMake(teste*4-55 + 20, 40, 100, 21)];
    eqEquals.textAlignment = NSTextAlignmentCenter;
    [eqEquals setText:@" = "];
    [self.view addSubview:eqEquals];
    UILabel* num4 = [[UILabel alloc] initWithFrame:CGRectMake(teste*5-50, 40, 100, 21)];
    num4.textAlignment = NSTextAlignmentCenter;
    [num4 setText:@"0"];
    [self.view addSubview:num4];
    
    _answer1.text = @" x1 = ";
    _answer3.text = @" x2 = ";
    
    _answer2.text = [NSString stringWithFormat: @"%d", [[self.receivedEquation.parts objectAtIndex:6] intValue]];
    _answer4.text = [NSString stringWithFormat: @"%d", [[self.receivedEquation.parts objectAtIndex:8] intValue]];
    
    if (self.receivedEquation.answerType == 2) {
        num1.attributedText = [[NSAttributedString alloc] initWithString:num1.text attributes:underline];
        num2.attributedText = [[NSAttributedString alloc] initWithString:num2.text attributes:underline];
        num3.attributedText = [[NSAttributedString alloc] initWithString:num3.text attributes:underline];
        num4.attributedText = [[NSAttributedString alloc] initWithString:num4.text attributes:underline];
        UILabel* denum1 = [[UILabel alloc] initWithFrame:CGRectMake(teste-50 + 10, 60, 100, 21)];
        [denum1 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:1] ]];
        denum1.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:denum1];
        UILabel* denum2 = [[UILabel alloc] initWithFrame:CGRectMake(teste*2-50 + 25, 60, 100, 21)];
        [denum2 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:3] ]];
        denum2.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:denum2];
        UILabel* denum3 = [[UILabel alloc] initWithFrame:CGRectMake(teste*3-50 + 35, 60, 100, 21)];
        [denum3 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:5] ]];
        denum3.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:denum3];
        UILabel* denum4 = [[UILabel alloc] initWithFrame:CGRectMake(teste*5-50, 60, 100, 21)];
        [denum4 setText:@"1"];
        denum4.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:denum4];
        
        self.answer2.attributedText = [[NSAttributedString alloc] initWithString:self.answer2.text attributes:underline];
        self.answer4.attributedText = [[NSAttributedString alloc] initWithString:self.answer4.text attributes:underline];
        
        _deAnswer2.text = [NSString stringWithFormat: @"%d", [[self.receivedEquation.parts objectAtIndex:7] intValue]];
        _deAnswer4.text = [NSString stringWithFormat: @"%d", [[self.receivedEquation.parts objectAtIndex:9] intValue]];
    }
    
    
    
    UILabel* formulas1 = [[UILabel alloc] initWithFrame:CGRectMake(teste-50+10, 460, 100, 100)];
    [formulas1 setText:[self.receivedEquation.formulas objectAtIndex:0]];
    [formulas1 sizeToFit];
    UILabel* formulas2 = [[UILabel alloc] initWithFrame:CGRectMake(teste-50+10, 490, 100, 100)];
    [formulas2 setText:[self.receivedEquation.formulas objectAtIndex:1]];
    [formulas2 sizeToFit];
    
    [self.view addSubview:formulas1];
    [self.view addSubview:formulas2];

}

- (void) initFirstD{
    NSDictionary *underline = @{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)};
    int teste = self.view.frame.size.width/6;
    
    
    UILabel* num1 = [[UILabel alloc] initWithFrame:CGRectMake(teste-50 + 10, 40, 100, 21)];
    num1.textAlignment = NSTextAlignmentCenter;
    [num1 setText:[NSString stringWithFormat:@"%@x",[self.receivedEquation.parts objectAtIndex:0]]];
    [self.view addSubview:num1];
    UILabel* num2 = [[UILabel alloc] initWithFrame:CGRectMake(teste*2-50 + 25, 40, 100, 21)];
    num2.textAlignment = NSTextAlignmentCenter;
    if ([[self.receivedEquation.parts objectAtIndex:2]intValue] >= 0) {
        [num2 setText:[NSString stringWithFormat:@"+ %@",[self.receivedEquation.parts objectAtIndex:2]]];
    } else{
        [num2 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:2]]];
    }
    [self.view addSubview:num2];
    UILabel* eqEquals = [[UILabel alloc] initWithFrame:CGRectMake(teste*3-50 + 20, 40, 100, 21)];
    eqEquals.textAlignment = NSTextAlignmentCenter;
    [eqEquals setText:@" = "];
    [self.view addSubview:eqEquals];
    UILabel* num4 = [[UILabel alloc] initWithFrame:CGRectMake(teste*4-50, 40, 100, 21)];
    num4.textAlignment = NSTextAlignmentCenter;
    [num4 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:4]]];
    [self.view addSubview:num4];
    
    _answer2.text = @" x = ";
    
    _answer3.text = [NSString stringWithFormat: @"%d", [[self.receivedEquation.parts objectAtIndex:6] intValue]];

    
    if (self.receivedEquation.answerType == 2) {
        num1.attributedText = [[NSAttributedString alloc] initWithString:num1.text attributes:underline];
        num2.attributedText = [[NSAttributedString alloc] initWithString:num2.text attributes:underline];
        num4.attributedText = [[NSAttributedString alloc] initWithString:num4.text attributes:underline];
        UILabel* denum1 = [[UILabel alloc] initWithFrame:CGRectMake(teste-50 + 10, 60, 100, 21)];
        [denum1 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:1]]];
        denum1.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:denum1];
        UILabel* denum2 = [[UILabel alloc] initWithFrame:CGRectMake(teste*2-50 + 20, 60, 100, 21)];
        [denum2 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:3]]];
        denum2.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:denum2];
        UILabel* denum4 = [[UILabel alloc] initWithFrame:CGRectMake(teste*4-50, 60, 100, 21)];
        [denum4 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:5]]];
        denum4.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:denum4];
         _deAnswer3.text = [NSString stringWithFormat: @"%d", [[self.receivedEquation.parts objectAtIndex:7] intValue]];
        
        self.answer3.attributedText = [[NSAttributedString alloc] initWithString:self.answer3.text attributes:underline];
        
        
    }
    
    UILabel* formulas1 = [[UILabel alloc] initWithFrame:CGRectMake(teste-50+10, 460, 100, 100)];
    [formulas1 setText:[self.receivedEquation.formulas objectAtIndex:0]];
    [formulas1 sizeToFit];
    
    [self.view addSubview:formulas1];
}

- (void) initLog{
    int teste = self.view.frame.size.width/6;
    

    
    
    UILabel* num1 = [[UILabel alloc] initWithFrame:CGRectMake(60, 49, 100, 21)];
    num1.textAlignment = NSTextAlignmentCenter;
    [num1 setText:@"log"];
    [self.view addSubview:num1];
    UILabel* num2 = [[UILabel alloc] initWithFrame:CGRectMake(80, 62, 100, 21)];
    num2.textAlignment = NSTextAlignmentCenter;
    [num2 setText:[self.receivedEquation.parts objectAtIndex:1]];
    [self.view addSubview:num2];
    UILabel* num3 = [[UILabel alloc] initWithFrame:CGRectMake(110, 49, 100, 21)];
    num3.textAlignment = NSTextAlignmentCenter;
    [num3 setText:[self.receivedEquation.parts objectAtIndex:0]];
    [self.view addSubview:num3];
    UILabel* eqEquals = [[UILabel alloc] initWithFrame:CGRectMake(160, 49, 100, 21)];
    eqEquals.textAlignment = NSTextAlignmentCenter;
    [eqEquals setText:@" = "];
    [self.view addSubview:eqEquals];
    UILabel* num4 = [[UILabel alloc] initWithFrame:CGRectMake(220, 49, 100, 21)];
    num4.textAlignment = NSTextAlignmentCenter;
    [num4 setText:@"X"];
    [self.view addSubview:num4];
    NSLog(@"Log");
    
    _answer2.text = @" X = ";
    _answer3.text = [NSString stringWithFormat: @"%d", [[self.receivedEquation.parts objectAtIndex:2] intValue]];
    
    UILabel* formulas1 = [[UILabel alloc] initWithFrame:CGRectMake(teste-50+10, 460, 100, 100)];
    [formulas1 setText:[self.receivedEquation.formulas objectAtIndex:0]];
    [formulas1 sizeToFit];
    
    [self.view addSubview:formulas1];
}

- (void) initFac{
    NSDictionary *underline = @{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)};
    
    
    switch (self.receivedEquation.inputType) {
        {case 0:
            if(1){}
            int teste = self.view.frame.size.width/6;
            UILabel* num1 = [[UILabel alloc] initWithFrame:CGRectMake(teste-50 + 10, 40, 100, 21)];
            num1.textAlignment = NSTextAlignmentCenter;
            [num1 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:0]]];
            [self.view addSubview:num1];
            UILabel* num2 = [[UILabel alloc] initWithFrame:CGRectMake(teste*2-50 + 25, 40, 100, 21)];
            num2.textAlignment = NSTextAlignmentCenter;
            if ([[self.receivedEquation.parts objectAtIndex:2] intValue] >= 0) {
                [num2 setText:[NSString stringWithFormat:@"+ %@",[self.receivedEquation.parts objectAtIndex:2]]];
            } else{
                [num2 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:2]]];
            }
            [self.view addSubview:num2];
            UILabel* eqEquals = [[UILabel alloc] initWithFrame:CGRectMake(teste*3-50 + 20, 40, 100, 21)];
            eqEquals.textAlignment = NSTextAlignmentCenter;
            [eqEquals setText:@" = "];
            [self.view addSubview:eqEquals];
            UILabel* num4 = [[UILabel alloc] initWithFrame:CGRectMake(teste*4-50, 40, 100, 21)];
            num4.textAlignment = NSTextAlignmentCenter;
            [num4 setText:@"0"];
            [self.view addSubview:num4];
            
            
            _answer1.text = [NSString stringWithFormat:@"(%@x", [self.receivedEquation.parts objectAtIndex:4]];
            if ([[self.receivedEquation.parts objectAtIndex:6] intValue] >= 0) {
                
                _answer2.text = [NSString stringWithFormat:@"+%@y)", [self.receivedEquation.parts objectAtIndex:6]];
            } else{
                _answer2.text = [NSString stringWithFormat:@"%@y)", [self.receivedEquation.parts objectAtIndex:6]];
            }
            _answer3.text = [NSString stringWithFormat:@"*   %@", [self.receivedEquation.parts objectAtIndex:8]];
            _answer4.text = @"=";
            _answer5.text = @"0";
            
            if (self.receivedEquation.answerType == 2) {
                num1.attributedText = [[NSAttributedString alloc] initWithString:num1.text attributes:underline];
                num2.attributedText = [[NSAttributedString alloc] initWithString:num2.text attributes:underline];
                num4.attributedText = [[NSAttributedString alloc] initWithString:num4.text attributes:underline];
                UILabel* denum1 = [[UILabel alloc] initWithFrame:CGRectMake(teste-50 + 10, 60, 100, 21)];
                [denum1 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:1]]];
                denum1.textAlignment = NSTextAlignmentCenter;
                [self.view addSubview:denum1];
                UILabel* denum2 = [[UILabel alloc] initWithFrame:CGRectMake(teste*2-50 + 20, 60, 100, 21)];
                [denum2 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:3]]];
                denum2.textAlignment = NSTextAlignmentCenter;
                [self.view addSubview:denum2];
                UILabel* denum4 = [[UILabel alloc] initWithFrame:CGRectMake(teste*4-50, 60, 100, 21)];
                [denum4 setText:@"1"];
                denum4.textAlignment = NSTextAlignmentCenter;
                [self.view addSubview:denum4];
                
                self.answer1.attributedText = [[NSAttributedString alloc] initWithString:self.answer1.text attributes:underline];
                self.answer2.attributedText = [[NSAttributedString alloc] initWithString:self.answer2.text attributes:underline];
                self.answer3.attributedText = [[NSAttributedString alloc] initWithString:self.answer3.text attributes:underline];
                
                _deAnswer1.text = [NSString stringWithFormat:@"%@", [self.receivedEquation.parts objectAtIndex:5]];
                _deAnswer2.text = [NSString stringWithFormat:@"%@", [self.receivedEquation.parts objectAtIndex:7]];
                _deAnswer3.text = [NSString stringWithFormat:@"%@", [self.receivedEquation.parts objectAtIndex:9]];
            }
            
            UILabel* formulas1 = [[UILabel alloc] initWithFrame:CGRectMake(teste-50+10, 460, 100, 100)];
            [formulas1 setText:[self.receivedEquation.formulas objectAtIndex:0]];
            [formulas1 sizeToFit];
            
            [self.view addSubview:formulas1];
            break;
        }
        {case 1:
            if(1){}
            int teste = self.view.frame.size.width/6;
            UILabel* num1 = [[UILabel alloc] initWithFrame:CGRectMake(teste-75, 40, 100, 21)];
            num1.textAlignment = NSTextAlignmentCenter;
            [num1 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:0]]];
            [self.view addSubview:num1];

            UILabel* num2 = [[UILabel alloc] initWithFrame:CGRectMake(teste*2-75 + 25, 40, 100, 21)];
            num2.textAlignment = NSTextAlignmentCenter;
            if ([[self.receivedEquation.parts objectAtIndex:2]intValue] >= 0){
                [num2 setText:[NSString stringWithFormat:@"+ %@",[self.receivedEquation.parts objectAtIndex:2]]];
            } else {
                [num2 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:2]]];
            }
            [self.view addSubview:num2];
            UILabel* num3 = [[UILabel alloc] initWithFrame:CGRectMake(teste*3-75 + 35, 40, 100, 21)];
            num3.textAlignment = NSTextAlignmentCenter;
            if ([[self.receivedEquation.parts objectAtIndex:4]intValue] >= 0){
                [num3 setText:[NSString stringWithFormat:@"+ %@",[self.receivedEquation.parts objectAtIndex:4]]];
            } else {
                [num3 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:4]]];
            }
            [self.view addSubview:num3];
            UILabel* num5 = [[UILabel alloc] initWithFrame:CGRectMake(teste*4-75 + 35, 40, 100, 21)];
            num5.textAlignment = NSTextAlignmentCenter;
            if ([[self.receivedEquation.parts objectAtIndex:6]intValue] >= 0){
                [num5 setText:[NSString stringWithFormat:@"+ %@",[self.receivedEquation.parts objectAtIndex:6]]];
            } else {
                [num5 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:6]]];
            }
            [self.view addSubview:num5];
            UILabel* eqEquals = [[UILabel alloc] initWithFrame:CGRectMake(teste*5-75 + 20, 40, 100, 21)];
            eqEquals.textAlignment = NSTextAlignmentCenter;
            [eqEquals setText:@" = "];
            [self.view addSubview:eqEquals];
            UILabel* num4 = [[UILabel alloc] initWithFrame:CGRectMake(teste*6-75, 40, 100, 21)];
            num4.textAlignment = NSTextAlignmentCenter;
            [num4 setText:@"0"];
            [self.view addSubview:num4];
            
            _answer1.text = [NSString stringWithFormat:@"(%@x", [self.receivedEquation.parts objectAtIndex:8]];
            if ([[self.receivedEquation.parts objectAtIndex:10] intValue] >= 0) {
                _answer2.text = [NSString stringWithFormat:@"+%@)", [self.receivedEquation.parts objectAtIndex:10]];
            } else{
                _answer2.text = [NSString stringWithFormat:@"%@)", [self.receivedEquation.parts objectAtIndex:10]];
            }
            _answer3.text = [NSString stringWithFormat:@"(%@y", [self.receivedEquation.parts objectAtIndex:12]];
            if ([[self.receivedEquation.parts objectAtIndex:14] intValue] >= 0) {
                _answer4.text = [NSString stringWithFormat:@"+%@)", [self.receivedEquation.parts objectAtIndex:14]];
            } else{
                _answer4.text = [NSString stringWithFormat:@"%@)", [self.receivedEquation.parts objectAtIndex:14]];
            }
            _answer5.text = [NSString stringWithFormat:@" * %@  =  0", [self.receivedEquation.parts objectAtIndex:16]];
            
            if (self.receivedEquation.answerType == 2) {
                num1.attributedText = [[NSAttributedString alloc] initWithString:num1.text attributes:underline];
                num2.attributedText = [[NSAttributedString alloc] initWithString:num2.text attributes:underline];
                num3.attributedText = [[NSAttributedString alloc] initWithString:num3.text attributes:underline];
                num5.attributedText = [[NSAttributedString alloc] initWithString:num5.text attributes:underline];
                num4.attributedText = [[NSAttributedString alloc] initWithString:num4.text attributes:underline];
                UILabel* denum1 = [[UILabel alloc] initWithFrame:CGRectMake(teste-75 + 10, 60, 100, 21)];
                [denum1 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:1]]];
                denum1.textAlignment = NSTextAlignmentCenter;
                [self.view addSubview:denum1];
                UILabel* denum2 = [[UILabel alloc] initWithFrame:CGRectMake(teste*2-75 + 20, 60, 100, 21)];
                [denum2 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:3]]];
                denum2.textAlignment = NSTextAlignmentCenter;
                [self.view addSubview:denum2];
                UILabel* denum3 = [[UILabel alloc] initWithFrame:CGRectMake(teste*3-75 + 35, 60, 100, 21)];
                [denum3 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:5]]];
                denum3.textAlignment = NSTextAlignmentCenter;
                [self.view addSubview:denum3];
                UILabel* denum5 = [[UILabel alloc] initWithFrame:CGRectMake(teste*4-75 + 35, 60, 100, 21)];
                [denum5 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:7]]];
                denum5.textAlignment = NSTextAlignmentCenter;
                [self.view addSubview:denum5];
                UILabel* denum4 = [[UILabel alloc] initWithFrame:CGRectMake(teste*6-75, 60, 100, 21)];
                [denum4 setText:@"1"];
                denum4.textAlignment = NSTextAlignmentCenter;
                [self.view addSubview:denum4];
                
                
                self.answer1.attributedText = [[NSAttributedString alloc] initWithString:self.answer1.text attributes:underline];
                self.answer2.attributedText = [[NSAttributedString alloc] initWithString:self.answer2.text attributes:underline];
                
                self.answer3.attributedText = [[NSAttributedString alloc] initWithString:self.answer3.text attributes:underline];
                self.answer4.attributedText = [[NSAttributedString alloc] initWithString:self.answer4.text attributes:underline];
                
                _deAnswer1.text = [NSString stringWithFormat:@"%@", [self.receivedEquation.parts objectAtIndex:9]];
                _deAnswer2.text = [NSString stringWithFormat:@"%@", [self.receivedEquation.parts objectAtIndex:11]];
                _deAnswer3.text = [NSString stringWithFormat:@"%@", [self.receivedEquation.parts objectAtIndex:13]];
                _deAnswer4.text = [NSString stringWithFormat:@"%@", [self.receivedEquation.parts objectAtIndex:15]];
                //_deAnswer5.text = [NSString stringWithFormat:@"%@", [self.receivedEquation.parts objectAtIndex:17]];
            }
            
            UILabel* formulas1 = [[UILabel alloc] initWithFrame:CGRectMake(teste-50+10, 460, 100, 100)];
            [formulas1 setText:[self.receivedEquation.formulas objectAtIndex:0]];
            [formulas1 sizeToFit];
            
            [self.view addSubview:formulas1];

            break;
        }
        {case 2:
            if(1){}
            int teste = self.view.frame.size.width/6;
            UILabel* num1 = [[UILabel alloc] initWithFrame:CGRectMake(teste-50 + 10, 40, 100, 21)];
            num1.textAlignment = NSTextAlignmentCenter;
            [num1 setText:[NSString stringWithFormat:@"%@x^2",[self.receivedEquation.parts objectAtIndex:0]]];
            [self.view addSubview:num1];
            UILabel* num2 = [[UILabel alloc] initWithFrame:CGRectMake(teste*2-50 + 25, 40, 100, 21)];
            num2.textAlignment = NSTextAlignmentCenter;
            if ([[self.receivedEquation.parts objectAtIndex:2] intValue] >= 0) {
                [num2 setText:[NSString stringWithFormat:@"+%@xy",[self.receivedEquation.parts objectAtIndex:2]]];
            } else {
                [num2 setText:[NSString stringWithFormat:@"%@xy",[self.receivedEquation.parts objectAtIndex:2]]];
            }
            [self.view addSubview:num2];
            UILabel* num3 = [[UILabel alloc] initWithFrame:CGRectMake(teste*3-50 + 35, 40, 100, 21)];
            num3.textAlignment = NSTextAlignmentCenter;
            if ([[self.receivedEquation.parts objectAtIndex:4] intValue] >= 0) {
                [num3 setText:[NSString stringWithFormat:@"+%@y^2",[self.receivedEquation.parts objectAtIndex:4]]];
            } else {
                [num3 setText:[NSString stringWithFormat:@"%@y^2",[self.receivedEquation.parts objectAtIndex:4]]];
            }
            [self.view addSubview:num3];
            UILabel* eqEquals = [[UILabel alloc] initWithFrame:CGRectMake(teste*4-50 + 20, 40, 100, 21)];
            eqEquals.textAlignment = NSTextAlignmentCenter;
            [eqEquals setText:@" = "];
            [self.view addSubview:eqEquals];
            UILabel* num4 = [[UILabel alloc] initWithFrame:CGRectMake(teste*5-50, 40, 100, 21)];
            num4.textAlignment = NSTextAlignmentCenter;
            [num4 setText:@"0"];
            [self.view addSubview:num4];
            
            _answer1.text = [NSString stringWithFormat:@"( %@x", [self.receivedEquation.parts objectAtIndex:6]];
            if ([[self.receivedEquation.parts objectAtIndex:8] intValue] >= 0) {
                
                _answer2.text = [NSString stringWithFormat:@"+%@y )", [self.receivedEquation.parts objectAtIndex:8]];
            } else{
            _answer2.text = [NSString stringWithFormat:@"%@y )", [self.receivedEquation.parts objectAtIndex:8]];
            }
            _answer3.text = [NSString stringWithFormat:@"( %@x", [self.receivedEquation.parts objectAtIndex:6]];
            if ([[self.receivedEquation.parts objectAtIndex:8] intValue] >= 0) {
                
                _answer4.text = [NSString stringWithFormat:@"+%@y )", [self.receivedEquation.parts objectAtIndex:8]];
            } else {
            _answer4.text = [NSString stringWithFormat:@"%@y )", [self.receivedEquation.parts objectAtIndex:8]];
            }
            _answer5.text = @" = 0";
            
            if (self.receivedEquation.answerType == 2) {
                num1.attributedText = [[NSAttributedString alloc] initWithString:num1.text attributes:underline];
                num2.attributedText = [[NSAttributedString alloc] initWithString:num2.text attributes:underline];
                num3.attributedText = [[NSAttributedString alloc] initWithString:num3.text attributes:underline];
                num4.attributedText = [[NSAttributedString alloc] initWithString:num4.text attributes:underline];
                UILabel* denum1 = [[UILabel alloc] initWithFrame:CGRectMake(teste-50 + 10, 60, 100, 21)];
                [denum1 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:1]]];
                denum1.textAlignment = NSTextAlignmentCenter;
                [self.view addSubview:denum1];
                UILabel* denum2 = [[UILabel alloc] initWithFrame:CGRectMake(teste*2-50 + 20, 60, 100, 21)];
                [denum2 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:3]]];
                denum2.textAlignment = NSTextAlignmentCenter;
                [self.view addSubview:denum2];
                UILabel* denum4 = [[UILabel alloc] initWithFrame:CGRectMake(teste*5-50, 60, 100, 21)];
                UILabel* denum3 = [[UILabel alloc] initWithFrame:CGRectMake(teste*3-50 + 35, 60, 100, 21)];
                denum3.textAlignment = NSTextAlignmentCenter;
                [denum3 setText:[NSString stringWithFormat:@"%@",[self.receivedEquation.parts objectAtIndex:5]]];
                [self.view addSubview:denum3];
                [denum4 setText:@"1"];
                denum4.textAlignment = NSTextAlignmentCenter;
                [self.view addSubview:denum4];
                
                self.answer1.attributedText = [[NSAttributedString alloc] initWithString:self.answer1.text attributes:underline];
                self.answer2.attributedText = [[NSAttributedString alloc] initWithString:self.answer2.text attributes:underline];
                
                self.answer3.attributedText = [[NSAttributedString alloc] initWithString:self.answer3.text attributes:underline];
                self.answer4.attributedText = [[NSAttributedString alloc] initWithString:self.answer4.text attributes:underline];
                
                _deAnswer1.text = [NSString stringWithFormat:@"%@", [self.receivedEquation.parts objectAtIndex:7]];
                _deAnswer2.text = [NSString stringWithFormat:@"%@", [self.receivedEquation.parts objectAtIndex:9]];
                _deAnswer3.text = [NSString stringWithFormat:@"%@", [self.receivedEquation.parts objectAtIndex:7]];
                _deAnswer4.text = [NSString stringWithFormat:@"%@", [self.receivedEquation.parts objectAtIndex:9]];
            }
            
            UILabel* formulas1 = [[UILabel alloc] initWithFrame:CGRectMake(teste-50+10, 460, 100, 100)];
            [formulas1 setText:[self.receivedEquation.formulas objectAtIndex:0]];
            [formulas1 sizeToFit];
            
            [self.view addSubview:formulas1];

            break;
        }
            
        {default:
            break;
        }
    }

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
