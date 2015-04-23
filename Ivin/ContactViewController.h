//
//  AcceptWineViewController.h
//  Ivin
//
//  Created by user on 3/1/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RateView.h"
#import "Wine.h"
#import "Winery.h"
#import "SingletonClass.h"
#import <MessageUI/MFMailComposeViewController.h>



@interface ContactViewController : UIViewController<MFMailComposeViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UIScrollView *sw;
@property (weak, nonatomic) IBOutlet UIImageView *iw;
@property (weak, nonatomic) IBOutlet UIButton *b1;
@property (weak, nonatomic) IBOutlet UIButton *b2;
@property (weak, nonatomic) IBOutlet UIButton *b3;
@property (weak, nonatomic) IBOutlet UIButton *b4;
@property (weak, nonatomic) IBOutlet UIButton *b5;
@property (weak, nonatomic) IBOutlet UIButton *b6;
@property (weak, nonatomic) IBOutlet UIButton *b7;

@end
