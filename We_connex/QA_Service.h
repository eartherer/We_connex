//
//  QA_Service.h
//  We_connex
//
//  Created by Earther on 25/01/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QA_Service : NSObject
+(NSObject*)getTopicList;
+(NSObject*)getTopicByTopicID:(int)ID;
+(NSObject*)getReplyListByTopicID:(int)ID;
+(NSObject*)getTopicAndReplyByTopicID:(int)ID;
@end
