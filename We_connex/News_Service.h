//
//  News_Service.h
//  We_connex
//
//  Created by Earther on 24/01/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News_Service : NSObject
+(NSObject*)getNews;
+(NSObject*)createNewsWithTitle:(NSString*)Title
                           Body:(NSString*)Body
                       lalitude:(float)latitude
                      longitude:(float)longitude
                          token:(NSString*)token;
@end
