//
//  User_Login_ViewController.m
//  We_connex
//
//  Created by macbook cpe00 on 2/9/2558 BE.
//  Copyright (c) 2558 Earther. All rights reserved.
//

#import "User_Login_ViewController.h"
#import "Profile_Area_Service.h"

@interface User_Login_ViewController ()

@end

@implementation User_Login_ViewController
{
    NSDictionary *tokenobj;
}
@synthesize userNameTxt;
@synthesize passwordTxt;

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)cancel:(id)sender {
}
- (IBAction)login:(id)sender {
    
    if ((userNameTxt.text.length<=0)||(passwordTxt.text.length<=0)){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log in Failed" message:@"Please check User Name/Pasword and try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else{
        tokenobj = [Profile_Area_Service LoginWithUsername:userNameTxt.text AndPassword:passwordTxt.text];
        if ([[tokenobj objectForKey:@"status"] integerValue]==100) {
            self.token = tokenobj;
            [self performSegueWithIdentifier:@"colorSelected" sender:self];
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log in Failed" message:@"Please check User Name/Pasword and try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            userNameTxt.text=nil;
            passwordTxt.text=nil;
        }
    }
    
    
}
@end
