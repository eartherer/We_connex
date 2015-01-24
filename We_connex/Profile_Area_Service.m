//
//  Profile_Area_Service.m
//  We_connex
//
//  Created by Earther on 24/01/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import "Profile_Area_Service.h"
#import "Connect_Url.h"

@implementation Profile_Area_Service

+(NSObject*)getAreaByLocationWithRadius:(NSString*)radius
                            AndLatitude:(NSString*)la
                           AndLongitude:(NSString*)lo{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/area.php?OP=show_arearad&cla=%@&clo=%@&rad=%@",la,lo,radius];
    //NSObject *resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    return resultObj;
}
+(NSObject*)getAreaByAreaID:(NSString*)AreaID{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/area.php?OP=show_areaid&areaID=%@",AreaID];
    //id resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    if ([resultObj isKindOfClass:[NSDictionary class]]) {
        NSLog(@"dsafasf");
    }
    return resultObj;
}
+(NSObject*)getProfileByID:(NSString*)numberID{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/profile.php?OP=show_id&numberID=%@",numberID];
    //NSObject *resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    return resultObj;
}

@end
