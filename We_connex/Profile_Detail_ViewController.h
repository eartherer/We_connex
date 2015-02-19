//
//  Profile_Detail_ViewController.h
//  We_connex
//
//  Created by macbook cpe00 on 2/18/2558 BE.
//  Copyright (c) 2558 Earther. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Profile_Detail_ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *profileTitle;
@property (weak, nonatomic) IBOutlet UILabel *profileDetail;
@property (weak, nonatomic) IBOutlet UILabel *areaTitle;
@property (weak, nonatomic) IBOutlet UILabel *areaDetail;
@property (nonatomic, strong) NSDictionary *token;
@end
