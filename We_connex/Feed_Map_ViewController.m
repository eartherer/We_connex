//
//  Feed_Map_ViewController.m
//  We_connex
//
//  Created by macbook cpe00 on 2/12/2558 BE.
//  Copyright (c) 2558 Earther. All rights reserved.
//

#import "Feed_Map_ViewController.h"

@interface Feed_Map_ViewController ()

@end

@implementation Feed_Map_ViewController
@synthesize mapView,latitude,longitude;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.delegate = self;
    // Do any additional setup after loading the view.
    CLLocationCoordinate2D annotationCoord;
    
    annotationCoord.latitude = [latitude floatValue];
    annotationCoord.longitude = [longitude floatValue];
    
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate = annotationCoord;
    [mapView addAnnotation:annotationPoint];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(annotationCoord, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
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
