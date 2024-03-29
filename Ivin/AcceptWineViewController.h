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


@interface AcceptWineViewController : UIViewController<RateViewDelegate,UIGestureRecognizerDelegate>//,UIScrollViewDelegate>


@property (weak, nonatomic) Wine  *wine;
@property (weak, nonatomic) Winery  *winery;
@property (weak, nonatomic) IBOutlet UIImageView  *starts;
//@property (weak, nonatomic) IBOutlet UILabel *covert;
//@property (weak, nonatomic) IBOutlet UILabel *la1;
@property (weak, nonatomic) IBOutlet UILabel *la2;
@property (weak, nonatomic) IBOutlet UILabel *la3;
@property (weak, nonatomic) IBOutlet UILabel *qrcode;
@property (weak, nonatomic) IBOutlet UILabel *la4;//酒农推荐label
@property (weak, nonatomic) IBOutlet UILabel *la5;//平均评价
@property (weak, nonatomic) IBOutlet UILabel *la6;//平均价格
@property (weak, nonatomic) IBOutlet UILabel *la7;//评价
@property (weak, nonatomic) IBOutlet UILabel *li2;//酒总类
@property (weak, nonatomic) IBOutlet UILabel *li3;//地区和国家
//@property (weak, nonatomic) IBOutlet UILabel *li4;//产区
@property (weak, nonatomic) IBOutlet UILabel *li8;//食物
@property (weak, nonatomic) IBOutlet UILabel *li9;//食物
@property (weak, nonatomic) IBOutlet UILabel *li10;//葡萄


@property (weak, nonatomic) IBOutlet RateView *rateView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *sw;
@property (weak, nonatomic) IBOutlet UIImageView *iw;
@property (weak, nonatomic) IBOutlet UIImageView *cup;
@property (weak, nonatomic) IBOutlet UILabel *sort;
@property (weak, nonatomic) IBOutlet UILabel *ratevalue;
@property (weak, nonatomic) IBOutlet UILabel *description1;
@property (weak, nonatomic) IBOutlet UILabel *pair;
@property (weak, nonatomic) IBOutlet UILabel *nameandyear;
@property (weak, nonatomic) IBOutlet UILabel *n1;
@property (weak, nonatomic) IBOutlet UILabel *n2;
@property (weak, nonatomic) IBOutlet UILabel *n3;



//-(IBAction) showgrapes;
-(IBAction) showwine;
-(IBAction) showwinery;


@end

