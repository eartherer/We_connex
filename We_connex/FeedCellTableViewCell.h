//
//  FeedCellTableViewCell.h
//  We_connex
//
//  Created by macbook cpe00 on 2/7/2558 BE.
//  Copyright (c) 2558 Earther. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *adderImage;
@property (weak, nonatomic) IBOutlet UILabel *adderName;
@property (weak, nonatomic) IBOutlet UILabel *addDate;
@property (weak, nonatomic) IBOutlet UILabel *topic;
@property (weak, nonatomic) IBOutlet UILabel *body;
@end
