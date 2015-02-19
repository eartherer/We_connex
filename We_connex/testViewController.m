//
//  testViewController.m
//  We_connex
//
//  Created by macbook cpe00 on 2/18/2558 BE.
//  Copyright (c) 2558 Earther. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()

@end

@implementation testViewController
@synthesize scrollView;
@synthesize contentView;
@synthesize labelText;

- (void)viewDidLoad {
    [super viewDidLoad];
    labelText.text = @"sdnbsjkbfsnfjsdbfsdbfjabdjfbajkdsbfjkabdsjkfbadjs,bfjkadbsfkjbadsjbfadjsfjadsbfjkasdb";
    //self.scrollView.contentSize = CGSizeMake(400, 1200);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
