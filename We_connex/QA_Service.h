//
//  QA_Service.h
//  We_connex
//
//  Created by Earther on 25/01/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QA_Service : NSObject

+createTopicWithTitle:(NSString*)Title
                 Body:(NSString*)Body
                Token:(NSString*)token;

+createReplyWithTopicID:(NSString*)topicid
                   Body:(NSString*)Body
                  Token:(NSString*)token;

+(NSObject*)getTopicList;
+(NSObject*)getTopicByTopicID:(int)ID;
+(NSObject*)getReplyListByTopicID:(int)ID;
+(NSObject*)getTopicAndReplyByTopicID:(int)ID;
@end
