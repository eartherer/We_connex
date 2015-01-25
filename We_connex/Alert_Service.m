//
//  Alert_Service.m
//  We_connex
//
//  Created by Earther on 25/01/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import "Alert_Service.h"
#import "Connect_Url.h"
@implementation Alert_Service
+(NSObject*)getAlertList{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/alert.php?OP=show_all"];
    //NSObject *resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    return resultObj;
}
+(NSObject*)getAlertByAlertID:(int)ID{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/alert.php?OP=show_alertid&id=%d",ID];
    //NSObject *resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    return resultObj;
}
+(NSObject*)getAlertByAdderID:(NSString*)ID{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/alert.php?OP=show_adder&id=%@",ID];
    //NSObject *resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    return resultObj;
}
+(NSObject*)getAreaByLocationWithRadius:(float)radius
                            AndLatitude:(float)la
                           AndLongitude:(float)lo{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/alert.php?OP=show_alertrad&cla=%f&clo=%f&rad=%f",la,lo,radius];
    //NSObject *resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    return resultObj;
}
+(NSObject*)getAlertByGroup:(NSString*)group{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/alert.php?OP=show_alertgroup&group=%@",group];
    //NSObject *resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    return resultObj;
}
@end
