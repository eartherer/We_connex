//
//  FeedCellTableViewCell.m
//  We_connex
//
//  Created by macbook cpe00 on 2/7/2558 BE.
//  Copyright (c) 2558 Earther. All rights reserved.
//

#import "FeedCellTableViewCell.h"

@implementation FeedCellTableViewCell
@synthesize adderImage = _adderImage;
@synthesize adderName = _adderName;
@synthesize addDate = _addDate;
@synthesize topic = _topic;
@synthesize body = _body;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
