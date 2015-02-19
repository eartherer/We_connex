//
//  Main_User_ViewController.m
//  We_connex
//
//  Created by macbook cpe00 on 2/9/2558 BE.
//  Copyright (c) 2558 Earther. All rights reserved.
//

#import "Main_User_ViewController.h"
#import "User_Login_ViewController.h"
#import "Profile_Area_Service.h"
#import "Profile_Detail_ViewController.h"
#import "User_Area_TableViewController.h"

@interface Main_User_ViewController ()

@end

@implementation Main_User_ViewController{
    NSDictionary *token;
}
@synthesize userImg;
@synthesize userRealName;
@synthesize userSurName;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    if (token==nil)
        [self performSegueWithIdentifier:@"test" sender:self];
    else{
        NSString *tokenStr = [[token objectForKey:@"data"] componentsSeparatedByString:@"."][1];
        NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:tokenStr options:0];
        NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
        NSString *userID = [decodedString componentsSeparatedByString:@"\",\"ID\":\""][1];
        userID = [userID substringToIndex:(userID.length-2)];
        NSDictionary *ProfileTemp = [Profile_Area_Service getProfileByID:userID];
        if ([[ProfileTemp objectForKey:@"code"] integerValue]==100){
            NSArray *Profile = [ProfileTemp objectForKey:@"data"];
            NSURL *url = [NSURL URLWithString:[Profile[0] objectForKey:@"pic_url"]];
            NSData *data = [[NSData alloc] initWithContentsOfURL:url];
            UIImage *tmpImage = [[UIImage alloc] initWithData:data];
            userImg.image = tmpImage;
            
            userRealName.text = [Profile[0] objectForKey:@"name"];
            
            userSurName.text = [Profile[0] objectForKey:@"surname"];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindFromModalViewController:(UIStoryboardSegue *)segue
{
    if ([segue.sourceViewController isKindOfClass:[User_Login_ViewController class]]) {
        
        User_Login_ViewController *colorsViewConroller = segue.sourceViewController;
        
        if (colorsViewConroller.token==nil) {
            [self.tabBarController setSelectedIndex:0];
        }
        else{
            NSLog(@"%@",colorsViewConroller.token);
            token=colorsViewConroller.token;
        }
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"viewprofiledetail"]){
        Profile_Detail_ViewController *dest = segue.destinationViewController;
        dest.token = token;
    }
    else if([segue.identifier isEqualToString:@"viewuserarea"]){
        User_Area_TableViewController *dest = segue.destinationViewController;
        dest.token = token;
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

- (IBAction)viewProfile:(id)sender {
}

- (IBAction)viewUserArea:(id)sender {
}

- (IBAction)viewStat:(id)sender {
}

- (IBAction)viewPM:(id)sender {
}

- (IBAction)logOut:(id)sender {
    token=nil;
    [self performSegueWithIdentifier:@"test" sender:self];
}
@end
