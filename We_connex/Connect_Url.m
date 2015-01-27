//
//  Connect_Url.m
//  We_connex
//
//  Created by Earther on 24/01/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import "Connect_Url.h"

@implementation Connect_Url

+(id)getDataWithURL:(NSString *)dst_url
  WithPostParameter:(NSString*)para{
    NSString *bodyData = para;
    
    NSMutableURLRequest *postRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:dst_url]];
    
    // Set the request's content type to application/x-www-form-urlencoded
    [postRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    // Designate the request a POST request and specify its body data
    [postRequest setHTTPMethod:@"POST"];
    [postRequest setHTTPBody:[NSData dataWithBytes:[bodyData UTF8String] length:strlen([bodyData UTF8String])]];
    
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:postRequest
                                          returningResponse:&response
                                                      error:&error];
    NSString *jstr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if (error == nil)
    {
        NSError *e = nil;
        id jsonArray = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
        
        if (!jsonArray)
        {
            return e;
        }else
        {
            return jsonArray;
        }
    }else
    {
        return error;
    }
}

+(id)getDataWithURL:(NSString*)dst_url{
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:dst_url]];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest
                                          returningResponse:&response
                                                      error:&error];
    
    if (error == nil)
    {
        //        NSString *jstr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //        NSString *sstr = [jstr stringByReplacingOccurrencesOfString:@"U" withString:@"u"];
        //        //NSString *utf = [jstr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        //        NSString *utf = sstr;
        //        NSLog(@"utf: %@", utf);
        //
        //        NSString *str = @"\u0e09\u0e31\u0e19\u0e23\u0e31\u0e01\u0e04\u0e38\u0e13";
        //        NSString *futf = [str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        //        NSLog(@"test: %@", futf);
        
        NSError *e = nil;
        id jsonArray = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
        
        if (!jsonArray) {
            return e;
            //NSLog(@"Error parsing JSON: %@", e);
        } else {
            //            for(NSDictionary *item in jsonArray) {
            //                for (NSString* key in item) {
            //                    id value = [item objectForKey:key];
            //                    NSLog(@"%@ : %@", key,value);
            //
            //                }
            //                // NSLog(@"Item: %@", item);
            //            }
            return jsonArray;
        }
        // Parse data here
    }else{
        return error;
    }
    
}


@end
