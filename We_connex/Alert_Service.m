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
+(NSObject*)createAlertWithTitle:(NSString*)Title
                            Body:(NSString*)Body
                        lalitude:(float)latitude
                       longitude:(float)longitude
                           Group:(NSString*)group
                           token:(NSString*)token{
    NSString *bodyData = [NSString stringWithFormat:@"Title=%@&Body=%@&latitude=%f&longitude=%f&token=%@&group=%@",Title,Body,latitude,longitude,token,group];
    NSString *targetUrl = @"http://beeconnex.azurewebsites.net/add_alert.php?OP=add";
    return [Connect_Url getDataWithURL:targetUrl WithPostParameter:bodyData];
}

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
