//
//  ProfileCell.m
//  Ivin
//
//  Created by user on 8/21/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "ProfileCell.h"

@implementation ProfileCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
            _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(85, 15, 320, 20)];
            _imageLable = [[UIImageView alloc] initWithFrame:CGRectMake(255, 13, 50, 50)];
 //           [_nameLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
            _nameLabel.textColor=[UIColor whiteColor];
//            [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"backlist.png"]]];
            [self addSubview:_nameLabel];
            [self addSubview:_imageLable];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
