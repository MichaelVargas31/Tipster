//
//  ViewController.m
//  Tipster
//
//  Created by michaelvargas on 6/25/19.
//  Copyright © 2019 michaelvargas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// minus = instance method
// plus = class method
// (return type) name: first parameter
- (IBAction)onTapOutOfKeys:(id)sender {
    NSLog(@"Hello");
    // must have @ bc must be compatible with C
    // without C, its a C string, not an Obj-C string
    
    [self.view endEditing: YES];
    // this is syntax for calling a function
    // to call it in Java, for example:
    // self.view.endEditing(YES);
    // endEditing is the method being invoked on self.view
}


- (IBAction)onEditBegin:(id)sender {
    [UIView animateWithDuration:.2 animations:^{
    self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y + 30, self.billField.frame.size.width, self.billField.frame.size.height);
        self.tipLabel.alpha = 0;
    }];
}

- (IBAction)onEditEnd:(id)sender {
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -= 30;
    
    [UIView animateWithDuration:.2 animations:^{
        self.billField.frame = newFrame;
        self.tipLabel.alpha = 1;
    }];
}







// in order to adjust values, we need an outlet
// outlet: like an ID in HTML
// define outlets up towards the top
// in C, class is split up into definition + implementation
// defined at the top, implemented among the code
- (IBAction)onBillEdit:(id)sender {
    NSLog(@"%@", self.billField.text);
    
    double bill =  [self.billField.text doubleValue];
    
    // @[ is a shortcut for creating an NSArray
    // @( is a shortcut for creating an NSNumber
    NSArray * percentages = @[@(0.15), @(0.20), @(0.25)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    // equivilant to percentages[self.tipControl.selectedSegmentIndex].doubleValue()
    
    //double bill = 100;
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    // NSLog(@"%f, %f, %f", bill, tip, total);
   self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    // referencing tipLabel object, then changing text data?
   self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
   // NSString* tempString = [NSString stringWithFormat:@"$%f", total];
 
}


@end
