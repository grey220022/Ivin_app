//
//  ThirdViewController.h
//  Ivin
//
//  Created by user on 2/27/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UIActionSheetDelegate, UIAlertViewDelegate>
//<UITableViewDataSource,UITableViewDelegate>
//{
//    NSArray * listData;
//}
//@property (weak, nonatomic) IBOutlet UISearchBar *searchbar;

@property (strong) UIActivityIndicatorView *activityIndicator;
@property (strong) IBOutlet UITextView *t1;
@property (strong) IBOutlet UITextView *t2;
@property (strong) IBOutlet UITextView *t3;


@end
