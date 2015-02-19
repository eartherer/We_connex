//
//  User_Login_ViewController.h
//  We_connex
//
//  Created by macbook cpe00 on 2/9/2558 BE.
//  Copyright (c) 2558 Earther. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface User_Login_ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelBtn;
- (IBAction)cancel:(id)sender;
@property (strong, nonatomic) NSDictionary *token;
- (IBAction)login:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *userNameTxt;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxt;
@end
