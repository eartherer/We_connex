//
//  ViewController.m
//  We_connex
//
//  Created by Earther on 20/01/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import "ViewController.h"
#import "News_Service.h"
#import "Alert_Service.h"
#import "Profile_Area_Service.h"
#import "Connect_Url.h"
@interface ViewController ()
-(NSObject*)getDataWithURL:(NSString*)dst_url;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [News_Service createNewsWithTitle:@"Xcode" Body:@"fromcode" lalitude:14.55 longitude:101.44 token:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJhdWQiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJpYXQiOjE0MjIzMzE4MDAsImV4cCI6MTQyMjMzNTQwMCwidXNlcm5hbWUiOiJhZG1pbiIsIklEIjoiMTEwMzcwMDk5MTkxMyJ9.7Epks8rziq_z5EQ9t7GLS39n-a_cl5109ivPxsbei_w"];
//    [Alert_Service createAlertWithTitle:@"Xcode" Body:@"fromcode" lalitude:14.55 longitude:101.44 Group: @"All" token:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJhdWQiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJpYXQiOjE0MjIzMzE4MDAsImV4cCI6MTQyMjMzNTQwMCwidXNlcm5hbWUiOiJhZG1pbiIsIklEIjoiMTEwMzcwMDk5MTkxMyJ9.7Epks8rziq_z5EQ9t7GLS39n-a_cl5109ivPxsbei_w"];
    NSObject *obj = [Profile_Area_Service registerWithUsername:@"xcode" Password:@"123456" ID:@"1103700111913" Email:@"xcoode@hotmail.com"];
    
    //[Connect_Url getDataWithURL:@"f" WithPostParameter:@"GG"];
//    [self getProfileByID:@"1103700881913"];
    //[Profile_Area_Service getAreaByAreaID:@"4"];
    //[News_Service getNews];
    //[self getAreaByLocationWithRadius:@"50" AndLatitude:@"13" AndLongitude:@"100"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(id)getDataWithURL:(NSString*)dst_url{
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
