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

+(NSObject*)getAreaByLocationWithRadius:(float)radius
                            AndLatitude:(float)la
                           AndLongitude:(float)lo{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/area.php?OP=show_arearad&cla=%f&clo=%f&rad=%f",la,lo,radius];
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

+(NSObject*)LoginWithUsername:(NSString*)user
                  AndPassword:(NSString*)Pass{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/get_token.php?OP=get_token&user=%@&pass=%@",user,Pass];
    //NSObject *resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    return resultObj;
}
@end
