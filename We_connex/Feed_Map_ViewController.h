//
//  Feed_Map_ViewController.h
//  We_connex
//
//  Created by macbook cpe00 on 2/12/2558 BE.
//  Copyright (c) 2558 Earther. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface Feed_Map_ViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@end
