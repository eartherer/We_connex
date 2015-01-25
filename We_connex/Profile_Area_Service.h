//
//  Profile_Area_Service.h
//  We_connex
//
//  Created by Earther on 24/01/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile_Area_Service : NSObject
+(NSObject*)getAreaByLocationWithRadius:(float)radius
                            AndLatitude:(float)la
                           AndLongitude:(float)lo;

+(NSObject*)getAreaByAreaID:(NSString*)AreaID;

+(NSObject*)getProfileByID:(NSString*)numberID;

+(NSObject*)LoginWithUsername:(NSString*)user
                  AndPassword:(NSString*)Pass;
@end
