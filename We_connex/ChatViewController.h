//
//  ChatViewController.h
//  We_connex
//
//  Created by Earther on 18/02/2015.
//  Copyright (c) 2015 Earther. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView_chat;
- (IBAction)sendMessage:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *textView_MSG;
@property (weak, nonatomic) IBOutlet UIButton *BtnSend;

@end
