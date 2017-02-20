//
//  ViewController.m
//  BillSplitter
//
//  Created by Hyung Jip Moon on 2017-02-18.
//  Copyright © 2017 leomoon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *totalAmount;
@property (strong, nonatomic) IBOutlet UILabel *showSliderValue;
@property (strong, nonatomic) IBOutlet UILabel *amountEachPersonPay;

@property (strong, nonatomic) IBOutlet UITextField *getTotalAmount;

@property (strong, nonatomic) IBOutlet UISlider *numberOfPeopleSplitBill;

- (IBAction)calculateSplitAmount:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self valueChanged:self.numberOfPeopleSplitBill];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)calculateSplitAmount:(id)sender {
}

-(IBAction)valueChanged:(UISlider*)sender {
    
[self.numberOfPeopleSplitBill addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    NSString *labelString = [NSString stringWithFormat:@"%.f", self.numberOfPeopleSplitBill.value];
    [self.showSliderValue setText:labelString];
}


//[self.numberOfPeopleSplitBill addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];

@end
