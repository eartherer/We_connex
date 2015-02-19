//
//  Profile_Area_Service.m
//  We_connex
//
//  Created by Earther on 24/01/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import "Profile_Area_Service.h"
#import "Connect_Url.h"

@implementation Profile_Area_Service

+(NSObject*)registerWithUsername:(NSString*)username
                       Password:(NSString*)password
                             ID:(NSString*)numberID
                          Email:(NSString*)Email{
    NSString *bodyData = [NSString stringWithFormat:@"user=%@&pass=%@&email=%@&numberid=%@",username,password,Email,numberID];
    NSString *targetUrl = @"http://beeconnex.azurewebsites.net/reg.php";
    return [Connect_Url getDataWithURL:targetUrl WithPostParameter:bodyData];
}

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
                            Token:(NSString*)token{
    NSString* bodyData = [NSString stringWithFormat:@"name=%@&surname=%@&sex=%d&birthday=%@&house_no=%@&village_no=%@&alley=%@&road=%@&sub_district=%@&district=%@&province=%@&zip_code=%@&phone_number=%@&mobilephone_number=%@&token=%@",name,surname,sex,birthday,houseno,villageno,alley,road,sub_district,district,province,zipcode,phonenumber,mobilephone,token];
    NSString *targetUrl = @"http://beeconnex.azurewebsites.net/add_Profile.php?OP=add";
    return [Connect_Url getDataWithURL:targetUrl WithPostParameter:bodyData];
}

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
                             Token:(NSString*)token{
    NSString* bodyData = [NSString stringWithFormat:@"latitude=%f&longitude=%f&isOwner=%d&size=%f&area_type=%@&land_type=%@&house_no=%@&village_no=%@&alley=%@&road=%@&sub_district=%@&district=%@&province=%@&zip_code=%@&token=%@",latitude,longitude,isOwner,size,area_type,land_type,houseno,villageno,alley,road,sub_district,district,province,zipcode,token];
    NSString *targetUrl = @"http://beeconnex.azurewebsites.net/add_Area.php?OP=add";
    return [Connect_Url getDataWithURL:targetUrl WithPostParameter:bodyData];
}


+(NSObject*)getAreaByLocationWithRadius:(float)radius
                            AndLatitude:(float)la
                           AndLongitude:(float)lo{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/area.php?OP=show_arearad&cla=%f&clo=%f&rad=%f",la,lo,radius];
    //NSObject *resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    return resultObj;
}
+(NSObject*)getAreaByAreaID:(NSString*)AreaID{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/area.php?OP=show_areaid&areaID=%@",AreaID];
    //id resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    if ([resultObj isKindOfClass:[NSDictionary class]]) {
        NSLog(@"dsafasf");
    }
    return resultObj;
}
+(NSObject*)getAreaImageListByAreaID:(NSString*)areaID{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/area.php?OP=show_areapic&areaID=%@",areaID];
    //id resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    if ([resultObj isKindOfClass:[NSDictionary class]]) {
        NSLog(@"dsafasf");
    }
    return resultObj;
}

+(NSString*)getDataContainerByAreaID:(NSString*)areaID{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/area.php?OP=show_data_con&areaID=%@",areaID];
    //id resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    if ([resultObj isKindOfClass:[NSDictionary class]]) {
        NSLog(@"dsafasf");
    }
    return resultObj;
}

+(NSString*)getBeeDataByContainerID:(NSString*)conID{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/area.php?OP=show_beedata&conID=%@",conID];
    //id resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    if ([resultObj isKindOfClass:[NSDictionary class]]) {
        NSLog(@"dsafasf");
    }
    return resultObj;
}

+(NSObject*)getProfileByID:(NSString*)numberID{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/profile.php?OP=show_id&numberID=%@",numberID];
    //NSObject *resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    return resultObj;
}

+(NSObject*)LoginWithUsername:(NSString*)user
                  AndPassword:(NSString*)Pass{
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/get_token.php?OP=get_token&user=%@&pass=%@",user,Pass];
    //NSObject *resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    return resultObj;
}

+(NSObject*)uploadProfileImage:(UIImage*)image
                         token:(NSString*)token{
    NSData *imageData = UIImageJPEGRepresentation(image, 1);
    
    return [Connect_Url uploadDataWithURL:@"http://beeconnex.azurewebsites.net/up_profile_pic.php?op=up" Data:imageData Token:token];
}
+(NSObject*)uploadAreaImage:(UIImage*)image
                         token:(NSString*)token
                     AreaID:(NSString*)areaID{
    NSData *imageData = UIImageJPEGRepresentation(image, 1);
    
    return [Connect_Url uploadAreaDataWithURL:@"http://beeconnex.azurewebsites.net/up_area_pic.php?op=up" Data:imageData Token:token areaID:areaID];
}

+(NSObject*)getAreaListByOwnerID:(NSString*)ID{
    
    NSString* myurl = [NSString stringWithFormat:@"http://beeconnex.azurewebsites.net/area.php?OP=show_id&numberID=%@",ID];
    //NSObject *resultObj = [self getDataWithURL:myurl];
    id resultObj = [Connect_Url getDataWithURL:myurl];
    return resultObj;
}

@end
