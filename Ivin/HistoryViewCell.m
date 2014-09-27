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
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 15, 220, 40)];
        _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(19, 130, 90, 20)];
        _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(230, 45, 90, 20)];
        _subnameLabel= [[UILabel alloc]initWithFrame:CGRectMake(100, 40, 200, 80)];
        _subnameLabel2= [[UILabel alloc]initWithFrame:CGRectMake(100, 121, 220, 20)];
        _ratingnumberLable= [[UILabel alloc]initWithFrame:CGRectMake(67, 115, 50, 20)];
        
        _imageLable = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 70, 100)];
        
        [_nameLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14]];
        [_subnameLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:18]];
        [_subnameLabel2 setFont:[UIFont fontWithName:@"Arial-BoldMT" size:14]];
        [_ratingnumberLable setFont:[UIFont fontWithName:@"Arial-BoldMT" size:10]];
        
        
        _subnameLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _subnameLabel.numberOfLines = 0;
        
        
        _nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _nameLabel.numberOfLines = 0;
        
        
        
        _dateLabel.font=[UIFont fontWithName:@"ArialMT" size:13];
        _priceLabel.font=[UIFont fontWithName:@"Helvetica-BoldOblique" size:13];
        
        _nameLabel.textColor=[UIColor grayColor];
        _priceLabel.textColor=[UIColor whiteColor];
        _dateLabel.textColor=[UIColor whiteColor];
        _subnameLabel.textColor=[UIColor whiteColor];
        _subnameLabel2.textColor=[UIColor grayColor];
        _ratingnumberLable.textColor=[UIColor whiteColor];
        
        _ratingLable=[[UIImageView alloc] initWithFrame:CGRectMake(20, 105, 40, 40)];
        _ratingLable.contentMode=UIViewContentModeScaleAspectFit;
        //_imageLable.contentMode=UIViewContentModeScaleAspectFit;
        
        //[self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"backlist.png"]]];
        
        
        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"newline.png"] ];//:[ [UIImage imageNamed:@"backlist.png"] ] ];
        
        [self addSubview:_nameLabel];
        [self addSubview:_dateLabel];
        //[self addSubview:_priceLabel];
        
        [self addSubview:_imageLable];
        [self addSubview:_ratingLable];
        [self addSubview:_subnameLabel];
        [self addSubview:_subnameLabel2];
        [self addSubview:_ratingnumberLable];
        
        
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
