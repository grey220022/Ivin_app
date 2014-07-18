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


@interface AcceptWineViewController : UIViewController<RateViewDelegate,UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate>//,UIScrollViewDelegate>


@property (weak, nonatomic) Wine  *wine;
@property (weak, nonatomic) Winery  *winery;


@property (weak, nonatomic) IBOutlet UILabel *la1;
@property (weak, nonatomic) IBOutlet UILabel *la2;
@property (weak, nonatomic) IBOutlet UILabel *la3;
@property (weak, nonatomic) IBOutlet UILabel *la4;//酒农推荐label
@property (weak, nonatomic) IBOutlet UILabel *la5;//平均评价
@property (weak, nonatomic) IBOutlet UILabel *la6;//平均价格
@property (weak, nonatomic) IBOutlet UILabel *la7;//评价


@property(nonatomic,retain) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet RateView *rateView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *sw;
@property (weak, nonatomic) IBOutlet UIImageView *iw;


//@property (weak, nonatomic) IBOutlet UILabel *winery;
//@property (weak, nonatomic) IBOutlet UILabel *winename;
//@property (weak, nonatomic) IBOutlet UILabel *contry;
@property (weak, nonatomic) IBOutlet UILabel *sort;
//@property (weak, nonatomic) IBOutlet UILabel *zoom;
//@property (weak, nonatomic) IBOutlet UILabel *year;
@property (weak, nonatomic) IBOutlet UILabel *ratevalue;

//@property (weak, nonatomic) IBOutlet UILabel *la4;
@property (weak, nonatomic) IBOutlet UILabel *description;

@property (weak, nonatomic) IBOutlet UILabel *pair;
@property (weak, nonatomic) IBOutlet UITextField *price;
@property (weak, nonatomic) IBOutlet UITextView *personalnote;

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (weak, nonatomic) IBOutlet UITableView *newtable;


//@property (weak, nonatomic) IBOutlet UITextView *commenttext;



@property (weak, nonatomic) IBOutlet UILabel *nameandyear;


-(IBAction) showgrapes;
-(IBAction) showwine;
-(IBAction) showwinery;


@end

