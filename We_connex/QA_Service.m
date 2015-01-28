//
//  QA_Service.m
//  We_connex
//
//  Created by Earther on 25/01/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import "QA_Service.h"
#import "Connect_Url.h"

@implementation QA_Service

+createTopicWithTitle:(NSString*)Title
                 Body:(NSString*)Body
                Token:(NSString*)token{
    NSString *bodyData = [NSString stringWithFormat:@"Title=%@&Body=%@&token=%@",Title,Body,token];
    NSString *targetUrl = @"http://beeconnex.azurewebsites.net/add_topic.php?OP=add";
    return [Connect_Url getDataWithURL:targetUrl WithPostParameter:bodyData];
   
}

+createReplyWithTopicID:(NSString*)topicid
                 Body:(NSString*)Body
                Token:(NSString*)token{
    NSString *bodyData = [NSString stringWithFormat:@"topicid=%@&body=%@&token=%@",topicid,Body,token];
    NSString *targetUrl = @"http://beeconnex.azurewebsites.net/add_reply.php?OP=add";
    return [Connect_Url getDataWithURL:targetUrl WithPostParameter:bodyData];
    
}

+(NSObject*)getTopicList{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/qa.php?OP=topic_all"];
    //NSObject *resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    return resultObj;
}
+(NSObject*)getTopicByTopicID:(int)ID{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/qa.php?OP=topic_id&id=%d",ID];
    //NSObject *resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    return resultObj;
}
+(NSObject*)getReplyListByTopicID:(int)ID{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/qa.php?OP=reply_id&id=%d",ID];
    //NSObject *resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    return resultObj;
}
+(NSObject*)getTopicAndReplyByTopicID:(int)ID{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/qa.php?OP=topic_reply_id&id=%d",ID];
    //NSObject *resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    return resultObj;
}

@end
