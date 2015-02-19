//
//  Feed_Detail_ViewController.m
//  We_connex
//
//  Created by macbook cpe00 on 2/11/2558 BE.
//  Copyright (c) 2558 Earther. All rights reserved.
//

#import "Feed_Detail_ViewController.h"
#import "Feed_Map_ViewController.h"

@interface Feed_Detail_ViewController ()

@end

@implementation Feed_Detail_ViewController
@synthesize feedData;
@synthesize feedUser,feedType;
@synthesize topicTxt,userImg,userName,addedDate,bodyTxt,scrollView,subView,locationBtnOutlet;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (![[feedUser objectForKey:@"pic_url"] isKindOfClass:[NSNull class]]) {
        NSURL *url = [NSURL URLWithString:[feedUser objectForKey:@"pic_url"]];
        
        NSData *data = [[NSData alloc] initWithContentsOfURL:url];
        
        UIImage *tmpImage = [[UIImage alloc] initWithData:data];
        
        userImg.image = tmpImage;
    }
    
    if (![[feedUser objectForKey:@"name"] isKindOfClass:[NSNull class]]) {
        if (![[feedUser objectForKey:@"surname"] isKindOfClass:[NSNull class]])
            userName.text = [NSString stringWithFormat:@"%@ %@",[feedUser objectForKey:@"name"],[feedUser objectForKey:@"surname"]];
        else
            userName.text = [feedUser objectForKey:@"name"];
    }
    
    if (![[feedData objectForKey:@"added_date"] isKindOfClass:[NSNull class]])
        addedDate.text = [feedData objectForKey:@"added_date"];
    
    if (![[feedData objectForKey:@"title"] isKindOfClass:[NSNull class]]){
        topicTxt.text = [feedData objectForKey:@"title"];
        topicTxt.numberOfLines = 0;
        [topicTxt sizeToFit];
    }
    
    if (![[feedData objectForKey:@"body"] isKindOfClass:[NSNull class]]){
        bodyTxt.text = [feedData objectForKey:@"body"];
        bodyTxt.numberOfLines = 0;
        [bodyTxt sizeToFit];
    }
    
    if ([feedType isEqualToString:@"NEWS"]){
        locationBtnOutlet.enabled = NO;
    }
    else{
        locationBtnOutlet.enabled = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"viewfeedmap"]) {
        Feed_Map_ViewController *dest = segue.destinationViewController;
        dest.latitude = [feedData objectForKey:@"latitude"];
        dest.longitude = [feedData objectForKey:@"longitude"];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)locationBtn:(id)sender {
}
@end
