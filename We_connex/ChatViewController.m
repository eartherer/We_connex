//
//  ChatViewController.m
//  We_connex
//
//  Created by Earther on 18/02/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import "ChatViewController.h"
#import "Chat_Service.h"
@interface ChatViewController ()
@property NSArray *msgList;
@property NSString *userID;
@property NSString *lastMessaageID;
@property NSString *threadID;
@property int MessageCount;
@end

@implementation ChatViewController
@synthesize tableView_chat;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userID = @"1103700991913";
    self.textView_MSG.layer.cornerRadius = 15;
    self.threadID = @"2";
    self.MessageCount = 15;
    self.tableView_chat.allowsSelection = NO;
    self.BtnSend.layer.cornerRadius = 15;
    NSThread* myThread = [[NSThread alloc] initWithTarget:self
                                                 selector:@selector(LoadDataList)
                                                   object:nil];
    [myThread start];
    // Do any additional setup after loading the view.
}

- (void)LoadDataList{
    while (1) {
    NSDictionary *resultArr = [Chat_Service getMessageByThreadID:self.threadID WithCount:self.MessageCount];
    NSArray *arrr = [resultArr objectForKey:@"result"];
    self.msgList =arrr;
        NSString *lastID = [[self.msgList lastObject] objectForKey:@"ID"];
        if ([lastID isEqual:self.lastMessaageID]) {
            continue;
        }else{
            self.lastMessaageID = lastID;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView_chat reloadData];
            });
    [NSThread sleepForTimeInterval:5];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Set the data for this cell:
    
    //cell.textLabel.text = [[self.msgList objectAtIndex:indexPath.row] name];
    NSString *sending_id = [[self.msgList objectAtIndex:indexPath.section] objectForKey:@"SENDING_ID"];
    
    //cell.textLabel.text = [sending_id isEqual:self.userID] ? sending_id : @"ME";
    if ([sending_id isEqual:self.userID]) {
        cell.detailTextLabel.text = @"ME";
        [cell setBackgroundColor:[UIColor colorWithRed:0 green:1 blue:0 alpha:0.2]];
    }else{
        cell.detailTextLabel.text = sending_id;
        //[cell setBackgroundColor:[UIColor grayColor]];
        
        [cell setBackgroundColor:[UIColor colorWithRed:(238/255.0) green:(233/255.0) blue:(233/255.0) alpha:1]];
    }
    //cell.detailTextLabel.text = [sending_id isEqual:self.userID] ? sending_id : @"ME";
    
    //cell.detailTextLabel.text = @"sadfsadfdsf";
    //cell.detailTextLabel.text = [[self.msgList objectAtIndex:indexPath.row] objectForKey:@"BODY"];
    
    cell.textLabel.text = [[self.msgList objectAtIndex:indexPath.section] objectForKey:@"BODY"];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
    //cell.imageView.image = [UIImage imageNamed:@"flower.png"];
    cell.layer.cornerRadius = 20;
    //cell.layer.shadowOffset = CGSizeMake(0, 1);
    //cell.layer.shadowOpacity = 0.2;
//    CGRect frameC = cell.frame;
//    frameC.origin.x += 30;
//    frameC.size.width -=30;
//    // set the accessory view:
//    [cell setFrame:frameC];
    //cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    //[cell sizeToFit];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return self.msgList.count;
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    //[self animateTextView: YES];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    //[self animateTextView:NO];
}

- (void) animateTextView:(BOOL) up
{
    const int movementDistance = 80; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    int movement= movement = (up ? -movementDistance : movementDistance);
    NSLog(@"%d",movement);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.inputView.frame, 0, movement);
    [UIView commitAnimations];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)keyboardDidShow:(NSNotification *)notification
{
    NSDictionary* keyboardInfo = [notification userInfo];
    NSValue* keyboardFrameBegin = [keyboardInfo valueForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect keyboardFrameBeginRect = [keyboardFrameBegin CGRectValue];
    // Assign new frame to your view
    //[self.view setFrame:CGRectMake(0,-110,320,460)]; //here taken -20 for example i.e. your view will be scrolled to -20. change its value according to your requirement.
    [self.view setFrame:CGRectMake(self.view.frame.origin.x, -keyboardFrameBeginRect.size.height, self.view.frame.size.width, self.view.frame.size.height)];
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 3)];
    [headerView setBackgroundColor:[UIColor clearColor]];
    return headerView;
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    [self.view setFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 3; // you can have your own choice, of course
}
- (IBAction)sendMessage:(id)sender {
    if (![self.textView_MSG.text isEqual:@""]) {
        [Chat_Service sendMessageToThread:@"2" Message:self.textView_MSG.text Sender:self.userID];
    }
    self.textView_MSG.text = @"";
}
@end
