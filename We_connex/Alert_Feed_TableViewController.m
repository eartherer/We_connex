//
//  Alert_Feed_TableViewController.m
//  We_connex
//
//  Created by macbook cpe00 on 2/5/2558 BE.
//  Copyright (c) 2558 Earther. All rights reserved.
//

#import "Alert_Feed_TableViewController.h"
#import "SWRevealViewController.h"
#import "Alert_Service.h"
#import "Profile_Area_Service.h"
#import "FeedCellTableViewCell.h"
#import "Feed_Detail_ViewController.h"

@interface Alert_Feed_TableViewController ()

@end

@implementation Alert_Feed_TableViewController{
    NSArray *AlertObj;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    NSDictionary *alertTemp = [Alert_Service getAlertList];
    if([[alertTemp objectForKey:@"code"] integerValue]==100){
        AlertObj = [alertTemp objectForKey:@"data"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return AlertObj.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"FeedCell";
    
    FeedCellTableViewCell *cell = (FeedCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"FeedCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    if (![[[AlertObj objectAtIndex:indexPath.row] objectForKey:@"added_date"] isKindOfClass:[NSNull class]])
        cell.addDate.text = [[AlertObj objectAtIndex:indexPath.row] objectForKey:@"added_date"];
    
    if (![[[AlertObj objectAtIndex:indexPath.row] objectForKey:@"title"] isKindOfClass:[NSNull class]])
        cell.topic.text = [[AlertObj objectAtIndex:indexPath.row] objectForKey:@"title"];
    
    if (![[[AlertObj objectAtIndex:indexPath.row] objectForKey:@"body"] isKindOfClass:[NSNull class]])
        cell.body.text = [[AlertObj objectAtIndex:indexPath.row] objectForKey:@"body"];
    
    if (![[[AlertObj objectAtIndex:indexPath.row] objectForKey:@"adder_id"] isKindOfClass:[NSNull class]]) {
        NSDictionary *profileTemp = [Profile_Area_Service getProfileByID:[[AlertObj objectAtIndex:indexPath.row] objectForKey:@"adder_id"]];
        if([[profileTemp objectForKey:@"code"] integerValue]==100){
            NSArray *Profile = [profileTemp objectForKey:@"data"];
            if (Profile!=nil && Profile.count>0) {
                
                if (![[Profile[0] objectForKey:@"name"] isKindOfClass:[NSNull class]]) {
                    if (![[Profile[0] objectForKey:@"surname"] isKindOfClass:[NSNull class]])
                        cell.adderName.text = [NSString stringWithFormat:@"%@ %@",[Profile[0] objectForKey:@"name"],[Profile[0] objectForKey:@"surname"]];
                    else
                        cell.adderName.text = [Profile[0] objectForKey:@"name"];
                }
                
                /*if (![[Profile[0] objectForKey:@"pic_url"] isKindOfClass:[NSNull class]]) {
                 NSURL *url = [NSURL URLWithString:[Profile[0] objectForKey:@"pic_url"]];
                 
                 NSData *data = [[NSData alloc] initWithContentsOfURL:url];
                 
                 UIImage *tmpImage = [[UIImage alloc] initWithData:data];
                 
                 cell.adderImage.image = tmpImage;
                 }*/
            }
        }
    }
    
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 163;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"AlertDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"AlertDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Feed_Detail_ViewController *destViewController = segue.destinationViewController;
        destViewController.feedData = [AlertObj objectAtIndex:indexPath.row];
        NSDictionary *profileTemp = [Profile_Area_Service getProfileByID:[[AlertObj objectAtIndex:indexPath.row] objectForKey:@"adder_id"]];
        if([[profileTemp objectForKey:@"code"] integerValue]==100){
            NSArray *Profile = [profileTemp objectForKey:@"data"];
            if (Profile!=nil && Profile.count>0) {
                destViewController.feedUser = Profile[0];
            }
        }
        destViewController.feedType = @"ALERT";
        
        
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
