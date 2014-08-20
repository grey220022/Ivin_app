//
//  ProfileView.h
//  Ivin
//
//  Created by user on 3/17/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileView : UIViewController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,retain) IBOutlet UITableView *tableview;

@end
