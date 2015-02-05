//
//  Chat_Service.m
//  We_connex
//
//  Created by Earther on 05/02/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import "Chat_Service.h"
#import "Connect_Url.h"
@implementation Chat_Service

/////
+(NSObject*)getThreadIDByUserID_1:(NSString*)userid1
           AndUserID_2:(NSString*)userid2{
    NSString *bodyData = [NSString stringWithFormat:@"OP=GET_THREAD_ID_BY_PAIR&id1=%@&id2=%@",userid1,userid2];
    NSString *targetUrl = @"http://beeconnex.azurewebsites.net/chat_manage.php";
    return [Connect_Url getDataWithURL:targetUrl WithPostParameter:bodyData];
}

+(NSObject*)getMessageByThreadID:(NSString*)threadid
                       WithCount:(int)count{
    NSString *bodyData = [NSString stringWithFormat:@"OP=GET_MSG&thread_id=%@&msg_count=%d",threadid,count];
    NSString *targetUrl = @"http://beeconnex.azurewebsites.net/chat_manage.php";
    return [Connect_Url getDataWithURL:targetUrl WithPostParameter:bodyData];
}

+(NSObject*)sendMessageToThread:(NSString*)threadid
                        Message:(NSString*)msg
                         Sender:(NSString*)sender{
    NSString *bodyData = [NSString stringWithFormat:@"OP=SEND_MSG&T_ID=%@&SEND_TEXT=%@&SEND_ID=%@",threadid,msg,sender];
    NSString *targetUrl = @"http://beeconnex.azurewebsites.net/chat_manage.php";
    return [Connect_Url getDataWithURL:targetUrl WithPostParameter:bodyData];
}
@end
