//
//  ViewController.m
//  We_connex
//
//  Created by Earther on 20/01/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import "ViewController.h"
#import "Profile_Area_Service.h"
@interface ViewController ()
-(NSObject*)getDataWithURL:(NSString*)dst_url;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self getProfileByID:@"1103700881913"];
    [Profile_Area_Service getAreaByAreaID:@"4"];
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
