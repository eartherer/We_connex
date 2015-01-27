//
//  News_Service.m
//  We_connex
//
//  Created by Earther on 24/01/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import "News_Service.h"
#import "Connect_Url.h"
@implementation News_Service
+(NSObject*)getNews{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/news.php?OP=show_all"];
    //NSObject *resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    return resultObj;
}

+(NSObject*)createNewsWithTitle:(NSString*)Title
                           Body:(NSString*)Body
                       lalitude:(float)latitude
                      longitude:(float)longitude
                          token:(NSString*)token{
    NSString *bodyData = [NSString stringWithFormat:@"Title=%@&Body=%@&latitude=%f&longitude=%f&token=%@",Title,Body,latitude,longitude,token];
    NSString *targetUrl = @"http://beeconnex.azurewebsites.net/add_news.php?OP=add";
    return [Connect_Url getDataWithURL:targetUrl WithPostParameter:bodyData];
}
@end
