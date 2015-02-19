//
//  AreaCell_TableViewCell.m
//  We_connex
//
//  Created by macbook cpe00 on 2/19/2558 BE.
//  Copyright (c) 2558 Earther. All rights reserved.
//

#import "AreaCell_TableViewCell.h"

@implementation AreaCell_TableViewCell
@synthesize areaSize = _areaSize;
@synthesize areaOwner = _areaOwner;
@synthesize areaType = _areaType;
@synthesize landType = _landType;


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
