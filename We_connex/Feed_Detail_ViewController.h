//
//  Feed_Detail_ViewController.h
//  We_connex
//
//  Created by macbook cpe00 on 2/11/2558 BE.
//  Copyright (c) 2558 Earther. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Feed_Detail_ViewController : UIViewController

@property (nonatomic, strong) NSDictionary *feedData;
@property (nonatomic, strong) NSDictionary *feedUser;
@property (nonatomic, strong) NSString *feedType;
@property (weak, nonatomic) IBOutlet UILabel *topicTxt;
@property (weak, nonatomic) IBOutlet UIImageView *userImg;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *addedDate;
- (IBAction)locationBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *locationBtnOutlet;
@property (weak, nonatomic) IBOutlet UILabel *bodyTxt;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *subView;
@end
