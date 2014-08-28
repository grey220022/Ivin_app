//
//  ProfileCityView.h
//  Ivin
//
//  Created by user on 3/26/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileCityView : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>
@property(nonatomic,retain) IBOutlet UITextField *text;
@property(nonatomic,retain) IBOutlet UITextField *t2;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end
