//
//  User_Area_Detail_ViewController.m
//  We_connex
//
//  Created by macbook cpe00 on 2/19/2558 BE.
//  Copyright (c) 2558 Earther. All rights reserved.
//

#import "User_Area_Detail_ViewController.h"
#import "Profile_Area_Service.h"

@interface User_Area_Detail_ViewController ()

@end

@implementation User_Area_Detail_ViewController{
    NSArray *AreaDetail;
}
@synthesize areaID,areaDetailInfo,areaDetailTitle,mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    areaDetailTitle.text = @"ขนาด\nลักษณะพื้นที่\nลักษณะดิน\nเป็นเจ้าของ\nบ้านเลขที่\nหมู่ที่\nหมู่บ้าน\nถนน\nแขวง\nเขต\nจังหวัด\nรหัสไปรษณีย์\nตำแหน่งทางภูมิศาสตร์";
    areaDetailTitle.numberOfLines = 0;
    [areaDetailTitle sizeToFit];
    
    NSDictionary *AreaTemp = [Profile_Area_Service getAreaByAreaID:areaID];;
    if ([[AreaTemp objectForKey:@"code"] integerValue]==100){
        AreaDetail = [AreaTemp objectForKey:@"data"];
        
        NSString *isOwner;
        if([[AreaDetail[0] objectForKey:@"isOwner"] isEqualToString:@"0"])
            isOwner = @"ไม่";
        else if([[AreaDetail[0] objectForKey:@"isOwner"] isEqualToString:@"1"])
            isOwner = @"ใช่";
        else
            isOwner = @"-";
        NSString *areaInfo = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@ , %@",[AreaDetail[0] objectForKey:@"size"],[AreaDetail[0] objectForKey:@"area_type"],[AreaDetail[0] objectForKey:@"land_type"],isOwner,[AreaDetail[0] objectForKey:@"house_no"],[AreaDetail[0] objectForKey:@"village_no"],[AreaDetail[0] objectForKey:@"alley"],[AreaDetail[0] objectForKey:@"road"],[AreaDetail[0] objectForKey:@"sub_district"],[AreaDetail[0] objectForKey:@"district"],[AreaDetail[0] objectForKey:@"province"],[AreaDetail[0] objectForKey:@"zip_code"],[AreaDetail[0] objectForKey:@"latitude"],[AreaDetail[0] objectForKey:@"longitude"]];
        areaDetailInfo.text = areaInfo;
        areaDetailInfo.numberOfLines = 0;
        [areaDetailInfo sizeToFit];
        
        self.mapView.delegate = self;
        // Do any additional setup after loading the view.
        CLLocationCoordinate2D annotationCoord;
        
        annotationCoord.latitude = [[AreaDetail[0] objectForKey:@"latitude"] floatValue];
        annotationCoord.longitude = [[AreaDetail[0] objectForKey:@"longitude"] floatValue];
        
        MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
        annotationPoint.coordinate = annotationCoord;
        [mapView addAnnotation:annotationPoint];
        
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(annotationCoord, 800, 800);
        [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    }
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
