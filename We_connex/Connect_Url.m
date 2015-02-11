//
//  Connect_Url.m
//  We_connex
//
//  Created by Earther on 24/01/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import "Connect_Url.h"

@implementation Connect_Url

+(id)uploadDataWithURL:(NSString*)url
                  Data:(NSData*)data
                 Token:(NSString *)token{
    //NSData *imageData = UIImageJPEGRepresentation(image, 1);
    NSString *urlString = url;
    NSString *boundary = @"Weconnex";
    NSMutableData *body = [NSMutableData data];
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    

     // add token
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", @"token"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"%@\r\n", token] dataUsingEncoding:NSUTF8StringEncoding]];
    
    ////Add Image data
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Disposition: form-data; name=\"fileToUpload\"; filename=\"squaretwosmall.jpg\"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];

    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:data]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    
    
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
//     {
//         
//         NSData *returnData = data;
//         NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
//         NSLog(@"data recieved!");
//         
//         //Do what you want with your return data.
//         
//     }];
    
        NSURLResponse * response = nil;
        NSError * error = nil;
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
        if (error == nil)
        {
            NSError *e = nil;
            id jsonArray = [NSJSONSerialization JSONObjectWithData: returnData options: NSJSONReadingMutableContainers error: &e];
        
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
   //return returnString;
}

+(id)uploadAreaDataWithURL:(NSString*)url
                  Data:(NSData*)data
                 Token:(NSString *)token
                areaID:(NSString*)areaID{
    //NSData *imageData = UIImageJPEGRepresentation(image, 1);
    NSString *urlString = url;
    NSString *boundary = @"Weconnex";
    NSMutableData *body = [NSMutableData data];
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    
    
    // add token
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", @"token"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"%@\r\n", token] dataUsingEncoding:NSUTF8StringEncoding]];
    
    // add areaID
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", @"areaID"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"%@", areaID] dataUsingEncoding:NSUTF8StringEncoding]];
    
    ////Add Image data
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Disposition: form-data; name=\"fileToUpload\"; filename=\"squaretwosmall.jpg\"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:data]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    
    
    //    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    //    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
    //     {
    //
    //         NSData *returnData = data;
    //         NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    //         NSLog(@"data recieved!");
    //
    //         //Do what you want with your return data.
    //
    //     }];
    
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    if (error == nil)
    {
        NSError *e = nil;
        id jsonArray = [NSJSONSerialization JSONObjectWithData: returnData options: NSJSONReadingMutableContainers error: &e];
        
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
    //return returnString;
}


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
