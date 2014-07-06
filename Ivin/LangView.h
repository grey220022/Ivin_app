//
//  LangView.h
//  Ivin
//
//  Created by user on 4/6/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LangView : UIViewController<UITableViewDataSource,UITableViewDelegate>



@property(nonatomic,retain) IBOutlet UITableView *tableview;

@end
UIAlertView *myAlertView;
int lang;

