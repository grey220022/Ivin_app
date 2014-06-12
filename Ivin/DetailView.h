//
//  DetailView.h
//  Ivin
//
//  Created by user on 4/28/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RateView.h"


@interface DetailView : UIViewController<RateViewDelegate>

@property (weak, nonatomic) IBOutlet RateView *rateView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;


@end
