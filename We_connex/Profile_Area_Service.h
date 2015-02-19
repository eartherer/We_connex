//
//  Profile_Area_Service.h
//  We_connex
//
//  Created by Earther on 24/01/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Profile_Area_Service : NSObject

+(NSObject*)getAreaListByOwnerID:(NSString*)ID;

+(NSObject*)uploadAreaImage:(UIImage*)image
                      token:(NSString*)token
                     AreaID:(NSString*)areaID;

+(NSObject*)getAreaImageListByAreaID:(NSString*)areaID;

+(NSString*)getDataContainerByAreaID:(NSString*)areaID;

+(NSString*)getBeeDataByContainerID:(NSString*)conID;

+(NSObject*)uploadProfileImage:(UIImage*)image
                         token:(NSString*)token;

+(NSObject*)getAreaByLocationWithRadius:(float)radius
                            AndLatitude:(float)la
                           AndLongitude:(float)lo;

+(NSObject*)getAreaByAreaID:(NSString*)AreaID;

+(NSObject*)getProfileByID:(NSString*)numberID;

+(NSObject*)LoginWithUsername:(NSString*)user
                  AndPassword:(NSString*)Pass;

+(NSObject*)registerWithUsername:(NSString*)username
                        Password:(NSString*)password
                              ID:(NSString*)numberID
                           Email:(NSString*)Email;

+(NSObject*)createProfileWithName:(NSString*)name
                          Surname:(NSString*)surname
                              sex:(int)sex
                         Birthday:(NSString*)birthday
                         House_No:(NSString*)houseno
                       Village_No:(NSString*)villageno
                            Alley:(NSString*)alley
                             Road:(NSString*)road
                     Sub_District:(NSString*)sub_district
                         District:(NSString*)district
                         Province:(NSString*)province
                         Zip_Code:(NSString*)zipcode
                     Phone_Number:(NSString*)phonenumber
               MobilePhone_Number:(NSString*)mobilephone
                            Token:(NSString*)token;

+(NSObject*)createAreaWithLatitude:(float)latitude
                         Longitude:(float)longitude
                           isOwner:(int)isOwner
                              Size:(float)size
                          AreaType:(NSString*)area_type
                          LandType:(NSString*)land_type
                           HouseNo:(NSString*)houseno
                         VillageNo:(NSString*)villageno
                             Alley:(NSString*)alley
                              Road:(NSString*)road
                      Sub_District:(NSString*)sub_district
                          District:(NSString*)district
                          Province:(NSString*)province
                          Zip_Code:(NSString*)zipcode
                             Token:(NSString*)token;
@end
