//
//  Profile_Area_Service.h
//  We_connex
//
//  Created by Earther on 24/01/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile_Area_Service : NSObject
+(NSObject*)getAreaByLocationWithRadius:(NSString*)radius
                            AndLatitude:(NSString*)la
                           AndLongitude:(NSString*)lo;

+(NSObject*)getAreaByAreaID:(NSString*)AreaID;

+(NSObject*)getProfileByID:(NSString*)numberID;

@end
