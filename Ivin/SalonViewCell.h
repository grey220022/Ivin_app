//
//  SalonViewCell.h
//  Ivin
//
//  Created by user on 5/18/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SalonViewCell : UITableViewCell
@property ( nonatomic) IBOutlet UILabel * nameLabel;
@property ( nonatomic) IBOutlet UILabel * subnameLabel;
@property ( nonatomic) IBOutlet UILabel * subnameLabel2;
@property ( nonatomic) IBOutlet UILabel * dateLabel;
@property ( nonatomic) IBOutlet UILabel * priceLabel;
//@property ( nonatomic) IBOutlet UILabel * nameLabel;

@property ( nonatomic) IBOutlet UIImageView * imageLable;
@property ( nonatomic) IBOutlet UIImageView * ratingLable;
@property ( nonatomic) IBOutlet UILabel * ratingnumberLable;


@end
