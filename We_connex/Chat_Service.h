//
//  Chat_Service.h
//  We_connex
//
//  Created by Earther on 05/02/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import <Foundation/Foundation.h>
/////
@interface Chat_Service : NSObject
+(NSObject*)getThreadIDByUserID_1:(NSString*)userid1
                      AndUserID_2:(NSString*)userid2;
+(NSObject*)getMessageByThreadID:(NSString*)threadid
                       WithCount:(int)count;
+(NSObject*)sendMessageToThread:(NSString*)threadid
                        Message:(NSString*)msg
                         Sender:(NSString*)sender;
@end
