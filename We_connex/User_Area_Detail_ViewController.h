//
//  User_Area_Detail_ViewController.h
//  We_connex
//
//  Created by macbook cpe00 on 2/19/2558 BE.
//  Copyright (c) 2558 Earther. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface User_Area_Detail_ViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) NSString *areaID;
@property (weak, nonatomic) IBOutlet UILabel *areaDetailTitle;
@property (weak, nonatomic) IBOutlet UILabel *areaDetailInfo;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end
