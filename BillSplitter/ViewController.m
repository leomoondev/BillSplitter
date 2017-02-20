//
//  ViewController.m
//  BillSplitter
//
//  Created by Hyung Jip Moon on 2017-02-18.
//  Copyright © 2017 leomoon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *showSliderValue;
@property (strong, nonatomic) IBOutlet UILabel *showAmountEachPersonNeedsToPay;

@property (strong, nonatomic) IBOutlet UITextField *getTotalAmount;

@property (strong, nonatomic) IBOutlet UISlider *numberOfPeopleSplitBill;

- (IBAction)calculateSplitAmount:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    [self valueChanged:self.numberOfPeopleSplitBill];
    [self calculateSplitAmount:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)calculateSplitAmount:(id)sender {
    NSString *enteredText = [self.getTotalAmount text];

    NSString *sliderFloatValue = [self.showSliderValue text];
    
    NSNumberFormatter *firstNumberFormatter = [[NSNumberFormatter alloc] init];
    firstNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *firstNSNumber = [firstNumberFormatter numberFromString:enteredText];
    NSDecimalNumber *firstDecNumber = [NSDecimalNumber decimalNumberWithDecimal:[firstNSNumber decimalValue]];
    
    NSNumberFormatter *secondNumberFormatter = [[NSNumberFormatter alloc] init];
    secondNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *secondNSNumber = [secondNumberFormatter numberFromString:sliderFloatValue];
    NSDecimalNumber *secondDecNumber = [NSDecimalNumber decimalNumberWithDecimal:[secondNSNumber decimalValue]];
    
    NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler
                                       decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                       scale:2
                                       raiseOnExactness:NO
                                       raiseOnOverflow:NO
                                       raiseOnUnderflow:NO
                                       raiseOnDivideByZero:YES];
    
    NSDecimalNumber *finalOutput = [firstDecNumber decimalNumberByDividingBy:secondDecNumber withBehavior:roundUp];

    NSString *eachPersonPaymentValue = [NSString stringWithFormat:@"%@", finalOutput];
    
    [self.showAmountEachPersonNeedsToPay setText:eachPersonPaymentValue];
}

-(IBAction)valueChanged:(UISlider*)sender {
    
[self.numberOfPeopleSplitBill addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    NSString *labelString = [NSString stringWithFormat:@"%.f", self.numberOfPeopleSplitBill.value];
    [self.showSliderValue setText:labelString];
}

@end
