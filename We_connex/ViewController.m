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
#import "QA_Service.h"
@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
-(NSObject*)getDataWithURL:(NSString*)dst_url;
@end

@implementation ViewController
@synthesize showImg;
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [QA_Service createTopicWithTitle:@"Topic from xcode" Body:@"post from xcode" Token:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJhdWQiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJpYXQiOjE0MjI0MjU3NTksImV4cCI6MTQyMjQyOTM1OSwidXNlcm5hbWUiOiJhZG1pbiIsIklEIjoiMTEwMzcwMDk5MTkxMyJ9.N6XRWpMxcwPJeW9FdMH51AwZ1Zfh49mEBsY1TciqxmI"];
//    [QA_Service createReplyWithTopicID:@"7" Body:@"Reply from xcode" Token:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJhdWQiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJpYXQiOjE0MjI0MjU3NTksImV4cCI6MTQyMjQyOTM1OSwidXNlcm5hbWUiOiJhZG1pbiIsIklEIjoiMTEwMzcwMDk5MTkxMyJ9.N6XRWpMxcwPJeW9FdMH51AwZ1Zfh49mEBsY1TciqxmI"];
//    [Profile_Area_Service createAreaWithLatitude:13.4456 Longitude:103.2343 isOwner:1 Size:35.45 AreaType:@"ที่ราบ" LandType:@"ดินร่วน" HouseNo:@"-" VillageNo:@"-" Alley:@"นาเกลือ" Road:@"บางบ่อ" Sub_District:@"อยุธยา" District:@"อยุธยา" Province:@"กรุงเทพ" Zip_Code:@"70013" Token:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJhdWQiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJpYXQiOjE0MjI1NDg3MzgsImV4cCI6MTQyMjU1MjMzOCwidXNlcm5hbWUiOiJ4Y29kZSIsIklEIjoiMTEwMzcwMDExMTkxMyJ9.A_bwF6B4p55z9nYwdAPVCJIsfLu3SUZLTu_ogcwufN8"];
//    [Profile_Area_Service createAreaWithLatitude:13.4456 Longitude:103.2343 isOwner:1 Size:35.45 AreaType:@"ที่ราบ" LandType:@"ดินร่วน" HouseNo:@"-" VillageNo:@"-" Alley:@"นาเกลือ" Road:@"บางบ่อ" Sub_District:@"อยุธยา" District:@"อยุธยา" Province:@"กรุงเทพ" Zip_Code:@"70013" Token:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJhdWQiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJpYXQiOjE0MjI0MjU3NTksImV4cCI6MTQyMjQyOTM1OSwidXNlcm5hbWUiOiJhZG1pbiIsIklEIjoiMTEwMzcwMDk5MTkxMyJ9.N6XRWpMxcwPJeW9FdMH51AwZ1Zfh49mEBsY1TciqxmI"];

//    [News_Service createNewsWithTitle:@"Xcode" Body:@"fromcode" lalitude:14.55 longitude:101.44 token:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJhdWQiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJpYXQiOjE0MjIzMzE4MDAsImV4cCI6MTQyMjMzNTQwMCwidXNlcm5hbWUiOiJhZG1pbiIsIklEIjoiMTEwMzcwMDk5MTkxMyJ9.7Epks8rziq_z5EQ9t7GLS39n-a_cl5109ivPxsbei_w"];
//    [Alert_Service createAlertWithTitle:@"Xcode" Body:@"fromcode" lalitude:14.55 longitude:101.44 Group: @"All" token:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJhdWQiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJpYXQiOjE0MjIzMzE4MDAsImV4cCI6MTQyMjMzNTQwMCwidXNlcm5hbWUiOiJhZG1pbiIsIklEIjoiMTEwMzcwMDk5MTkxMyJ9.7Epks8rziq_z5EQ9t7GLS39n-a_cl5109ivPxsbei_w"];
//    NSObject *obj = [Profile_Area_Service registerWithUsername:@"xcode2" Password:@"123456" ID:@"1103700221913" Email:@"xcoode2@hotmail.com"];
//    NSObject *obj = [Profile_Area_Service createProfileWithName:@"testxcode" Surname:@"GGGG" sex:1 Birthday:@"2011-07-09" House_No:@"129" Village_No:@"gogo" Alley:@"popo" Road:@"pracha" Sub_District:@"dindin" District:@"dindeang" Province:@"bangkok" Zip_Code:@"10400" Phone_Number:@"0889999999" MobilePhone_Number:@"02098213123" Token:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJhdWQiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJpYXQiOjE0MjIzNzM5NTUsImV4cCI6MTQyMjM3NzU1NSwidXNlcm5hbWUiOiJ4Y29kZTIiLCJJRCI6IjExMDM3MDAyMjE5MTMifQ.Dsz0VDZz-1gCUbXCqxU3TSXCmdn5L4sL1n7MLfv208Q"];
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
-(void)up2:(UIImage*)image{
    NSData *imageData = UIImageJPEGRepresentation(image, 1);
    NSString *urlString = @"http://beeconnex.azurewebsites.net/up_file.php?op=up&numberID=1103700881913";
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    
    NSString *boundary = @"Weconnex";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Disposition: form-data; name=\"fileToUpload\"; filename=\"squaretwosmall.jpg\"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         
         NSData *returnData = data;
         NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
         NSLog(@"data recieved!");
         
         //Do what you want with your return data.
         
     }];
    
    
//    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];

}

-(void)uploadImage:(UIImage*)image{
                 if (1) {
                 // Build the request body
                 NSString *boundary = @"WeConnex";
                 NSMutableData *body = [NSMutableData data];
                 
                 // uid
//                 [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//                 [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", @"uid"] dataUsingEncoding:NSUTF8StringEncoding]];
//                 [body appendData:[[NSString stringWithFormat:@"%@\r\n", uid] dataUsingEncoding:NSUTF8StringEncoding]];
                 
                     
                     //capt
//                 [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//                 [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", @"caption"] dataUsingEncoding:NSUTF8StringEncoding]];
//                 [body appendData:[[NSString stringWithFormat:@"%@\r\n", capt] dataUsingEncoding:NSUTF8StringEncoding]];
                     
                     
                 // Body part for the attachament. This is an image.
                 NSData *imageData = UIImageJPEGRepresentation(image, 1);
                 if (imageData) {
                     [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                     [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.jpg\"\r\n", @"fileToUpload"] dataUsingEncoding:NSUTF8StringEncoding]];
                     [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
                     [body appendData:imageData];
                     [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
                 }
                 [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
                 
                 // Setup the session
//                 NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
//                 sessionConfiguration.HTTPAdditionalHeaders = @{
//                                                                @"api-key"       : @"55e76dc4bbae25b066cb",
//                                                                @"Accept"        : @"application/json",
//                                                                @"Content-Type"  : [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary]
//                                                                };
                 
                 // Create the session
                 // We can use the delegate to track upload progress
//                 NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
                 
                 // Data uploading task. We could use NSURLSessionUploadTask instead of NSURLSessionDataTask if we needed to support uploads in the background
                 NSURL *url = [NSURL URLWithString:@"http://beeconnex.azurewebsites.net/up_file.php?op=add&numberID=1103700881913"];
                 NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
                 request.HTTPMethod = @"POST";
                 request.HTTPBody = body;
                 NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                 NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    
//                 NSURLSessionDataTask *uploadTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//                     // Process the response
//                     NSString *charlieSendString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//                     [self.view hideToastActivity];
//                     NSLog(charlieSendString);
//                     if([charlieSendString isEqualToString:@"DONE"])
//                     {
//                         [self.view.window  makeToast:@"Upload Successful" duration:2.0 position:@"bottom"];
//                         self.cap.text = @"";
//                         self.imgg.image = [UIImage imageNamed:@"uppic.jpg"];
//                         [[[[self.tabBarController tabBar]items]objectAtIndex:1]setEnabled:TRUE];
//                         [[[[self.tabBarController tabBar]items]objectAtIndex:2]setEnabled:TRUE];
//                         [[[[self.tabBarController tabBar]items]objectAtIndex:0]setEnabled:TRUE];
//                         self.cap.enabled = YES;
//                         self.btupload.enabled = YES;
//                         //[self.tabBarController setSelectedIndex:1];
//                     }
//                     else
//                     {
//                         [self.view.window  makeToast:@"Uppload Failed" duration:2.0 position:@"bottom"];
//                         //[self.tabBarController setSelectedIndex:1];
//                     }
//                     
//                 }];
                 
             
         }
}

- (IBAction)upimg:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
    showImg.image = chosenImage;
    //[self up2:chosenImage];
    NSData *imageData = UIImageJPEGRepresentation(chosenImage, 1);

//    [Connect_Url uploadDataWithURL:@"http://beeconnex.azurewebsites.net/up_file.php?op=up&numberID=1103700881913" Data:imageData];
    [Profile_Area_Service uploadProfileImage:chosenImage token:@"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJhdWQiOiJodHRwOlwvXC9iZWVjb25uZXguYXp1cmV3ZWJzaXRlcy5uZXQiLCJpYXQiOjE0MjI4NjYyMjAsImV4cCI6MTQyMjg2OTgyMCwidXNlcm5hbWUiOiJhZG1pbiIsIklEIjoiMTEwMzcwMDk5MTkxMyJ9.qyrlgA1V7U43Vkkp-y843mKxCdTFqiIs1IwFNSKyts4"];
    //imgg.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        UIImageWriteToSavedPhotosAlbum(info[UIImagePickerControllerOriginalImage], nil, nil, nil);
    }
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    [self.navigationController popToRootViewControllerAnimated:YES];
    //[self.tabBarController setSelectedIndex:1];
    
    
}
@end
