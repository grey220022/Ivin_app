//
//  DetailView.h
//  Ivin
//
//  Created by user on 4/28/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RateView.h"


@interface DetailView : UIViewController<RateViewDelegate,UITextViewDelegate,UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet RateView *rateView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UITextView *commenttext;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) UIViewController * gg;
@property (weak, nonatomic) IBOutlet UILabel *placelabel;
@property (weak, nonatomic) IBOutlet UILabel *pricelabel;

@property (weak, nonatomic) IBOutlet UIButton *placebutton;
@property (weak, nonatomic) IBOutlet UIButton *pricebutton;
@property (weak, nonatomic) IBOutlet UIButton *collectbutton;
@property (weak, nonatomic) IBOutlet UIButton *likebutton;

@property (weak, nonatomic) IBOutlet UIImageView *likeimg;
@property (weak, nonatomic) IBOutlet UIImageView *collectimg;

@property (weak, nonatomic) IBOutlet UILabel *l1;
@property (weak, nonatomic) IBOutlet UILabel *l2;
@property (weak, nonatomic) IBOutlet UILabel *l3;
@property (weak, nonatomic) IBOutlet UILabel *l4;


@end

