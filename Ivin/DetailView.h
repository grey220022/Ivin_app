//
//  DetailView.h
//  Ivin
//
//  Created by user on 4/28/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RateView.h"


@interface DetailView : UIViewController<RateViewDelegate,UITextViewDelegate>

@property (weak, nonatomic) IBOutlet RateView *rateView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UITextView *commenttext;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) UIViewController * gg;



@end

