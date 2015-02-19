//
//  Main_User_ViewController.h
//  We_connex
//
//  Created by macbook cpe00 on 2/9/2558 BE.
//  Copyright (c) 2558 Earther. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Main_User_ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *userImg;
@property (weak, nonatomic) IBOutlet UILabel *userRealName;
@property (weak, nonatomic) IBOutlet UILabel *userSurName;
- (IBAction)viewProfile:(id)sender;
- (IBAction)viewUserArea:(id)sender;
- (IBAction)viewStat:(id)sender;
- (IBAction)viewPM:(id)sender;
- (IBAction)logOut:(id)sender;

@end
