//
//  ViewController.m
//  UnitConverter
//
//  Created by Sonja Riethig on 12/01/16.
//  Copyright © 2016 Sonja Riethig. All rights reserved.
//

#import "ViewController.h"


double convertIntoCentimeters (int bananas) {
    return bananas * 19.05;
}

double convertIntoGrams (int bananas) {
    return bananas * 183;
}

@interface ViewController () <UITextFieldDelegate>

@property (retain, nonatomic) IBOutlet UITextField *input;
@property (weak, nonatomic) IBOutlet UISegmentedControl *unitChooser;
@property (weak, nonatomic) IBOutlet UILabel *output;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.input.delegate = self;
    //self.input.keyboardType = UIKeyboardTypeNumberPad;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateButtonClicked:(id)sender {
    NSString *inputByUser = self.input.text;
    
    if (inputByUser == nil) {
        inputByUser = @"0";
    }
    if ([inputByUser containsString:@","]) {
        //error wrong input format
        [inputByUser componentsSeparatedByString:@","][0];
    }
    if ([inputByUser containsString:@"."]) {
        //error wrong input format
        [inputByUser componentsSeparatedByString:@"."][0];
    }
    
    int inputValue = [inputByUser intValue];
    double answer;
    NSString *chosenUnit = [NSString new];
    
    if (self.unitChooser.selectedSegmentIndex == 0) { //centimeters
        answer = convertIntoCentimeters(inputValue);
        chosenUnit = @"cm";
    } else if (self.unitChooser.selectedSegmentIndex == 1) {
        answer = convertIntoCentimeters(inputValue) / 100;
        chosenUnit = @"m";
    } else if (self.unitChooser.selectedSegmentIndex == 2) { //grams
        answer = convertIntoGrams(inputValue);
        chosenUnit = @"g";
    } else if (self.unitChooser.selectedSegmentIndex == 3) {
        answer = convertIntoGrams(inputValue) / 1000;
        chosenUnit = @"kg";
    }
    
    [self.output setText:[NSString stringWithFormat:@"%.2f %@", answer, chosenUnit]];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.input) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}

@end
