//
//  Alert_Service.h
//  We_connex
//
//  Created by Earther on 25/01/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Alert_Service : NSObject
+(NSObject*)createAlertWithTitle:(NSString*)Title
                            Body:(NSString*)Body
                        lalitude:(float)latitude
                       longitude:(float)longitude
                           Group:(NSString*)group
                           token:(NSString*)token;
+(NSObject*)getAlertList;
+(NSObject*)getAlertByAlertID:(int)ID;
+(NSObject*)getAlertByAdderID:(NSString*)ID;
+(NSObject*)getAreaByLocationWithRadius:(float)radius
                            AndLatitude:(float)la
                           AndLongitude:(float)lo;
+(NSObject*)getAlertByGroup:(NSString*)group;
@end
