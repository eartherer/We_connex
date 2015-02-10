//
//  Connect_Url.h
//  We_connex
//
//  Created by Earther on 24/01/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Connect_Url : NSObject
+(id)uploadDataWithURL:(NSString*)url
                  Data:(NSData*)data
                 Token:(NSString*)token;

+(id)getDataWithURL:(NSString*)dst_url;

+(id)getDataWithURL:(NSString *)dst_url
  WithPostParameter:(NSString*)para;

+(id)uploadAreaDataWithURL:(NSString*)url
                      Data:(NSData*)data
                     Token:(NSString *)token
                    areaID:(NSString*)areaID;
@end
