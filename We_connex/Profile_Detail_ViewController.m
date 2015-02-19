//
//  Profile_Detail_ViewController.m
//  We_connex
//
//  Created by macbook cpe00 on 2/18/2558 BE.
//  Copyright (c) 2558 Earther. All rights reserved.
//

#import "Profile_Detail_ViewController.h"
#import "Profile_Area_Service.h"

@interface Profile_Detail_ViewController ()

@end

@implementation Profile_Detail_ViewController
@synthesize profileImage,profileTitle,profileDetail,areaTitle,areaDetail,token;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated{
    self.profileTitle.text = @"ชื่อ\nเพศ\nวันเกิด\nรหัสประจำตัวประชาชน";
    self.profileTitle.numberOfLines = 0;
    [self.profileTitle sizeToFit];
    self.areaTitle.text = @"บ้านเลขที่\nหมู่ที่\nหมู่บ้าน\nถนน\nแขวง\nเขต\nจังหวัด\nรหัสไปรษณีย์\nโทรศัพท์\nมือถือ";
    self.areaTitle.numberOfLines = 0;
    [self.areaTitle sizeToFit];
    
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
        profileImage.image = tmpImage;
        
        NSString *gender;
        if([[Profile[0] objectForKey:@"sex"] isEqualToString:@"1"])
            gender = @"ชาย";
        else if([[Profile[0] objectForKey:@"sex"] isEqualToString:@"0"])
            gender = @"หญิง";
        else
            gender = @"-";
        NSString *profileInfo = [NSString stringWithFormat:@"%@ %@\n%@\n%@\n%@",[Profile[0] objectForKey:@"name"],[Profile[0] objectForKey:@"surname"],gender,[Profile[0] objectForKey:@"birthday"],[Profile[0] objectForKey:@"numberID"]];
        profileDetail.text = profileInfo;
        profileDetail.numberOfLines = 0;
        [profileDetail sizeToFit];
        
        NSString *areaInfo = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@",[Profile[0] objectForKey:@"house_no"],[Profile[0] objectForKey:@"village_no"],[Profile[0] objectForKey:@"alley"],[Profile[0] objectForKey:@"road"],[Profile[0] objectForKey:@"sub_district"],[Profile[0] objectForKey:@"district"],[Profile[0] objectForKey:@"province"],[Profile[0] objectForKey:@"zip_code"],[Profile[0] objectForKey:@"phone_number"],[Profile[0] objectForKey:@"mobilephone_number"]];
        areaDetail.text = areaInfo;
        areaDetail.numberOfLines = 0;
        [areaDetail sizeToFit];
    }

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
