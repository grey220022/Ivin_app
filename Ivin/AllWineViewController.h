//
//  ContentViewController.h
//  Ivin
//
//  Created by user on 6/16/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllWineViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain) IBOutlet UITableView *tableview;
@property(nonatomic,retain) NSMutableArray *classarray;
@property(nonatomic,retain) NSMutableArray *idarray;
@property(nonatomic,retain) NSMutableArray *imagearray;

@property(nonatomic) int filterlevel;
@property (strong) UIActivityIndicatorView *activityIndicator;


/*
@property(nonatomic,retain) NSMutableArray *WineName;
@property(nonatomic,retain) NSMutableArray *WineImageUrl;
@property(nonatomic,retain) NSMutableArray *WineryName;
@property(nonatomic,retain) NSMutableArray *WineryCountry;
@property(nonatomic,retain) NSMutableArray *Appellation;
@property(nonatomic,retain) NSMutableArray *Year;
@property(nonatomic,retain) NSMutableArray *AverageMark;
@property(nonatomic,retain) NSMutableArray *CreateDate;
@property(nonatomic,retain) NSMutableArray *WineCode;
@property(nonatomic,retain) NSMutableArray *WineId;
@property(nonatomic,retain) NSMutableArray *Likewine;
@property(nonatomic,retain) NSMutableArray *Favorite;
*/



@end


int mode;
