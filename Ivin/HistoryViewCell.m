//
//  HistoryViewCell.m
//  Ivin
//
//  Created by user on 5/18/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "HistoryViewCell.h"

@implementation HistoryViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(85, 15, 320, 20)];
        _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(85, 45, 90, 20)];
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(230, 45, 90, 20)];
        
        _imageLable = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 50, 50)];
        
        [_nameLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:20]];
        
        _dateLabel.font=[UIFont fontWithName:@"ArialMT" size:13];
        _priceLabel.font=[UIFont fontWithName:@"Helvetica-BoldOblique" size:13];
        
        _nameLabel.textColor=[UIColor whiteColor];
        _priceLabel.textColor=[UIColor whiteColor];
        _dateLabel.textColor=[UIColor whiteColor];
        
        
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"backlist.png"]]];
        
        [self addSubview:_nameLabel];
        [self addSubview:_dateLabel];
        [self addSubview:_priceLabel];
        
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
