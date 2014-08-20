//
//  NewloginView.h
//  Ivin
//
//  Created by user on 8/12/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewloginView : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *signuplabel;
@property (weak, nonatomic) IBOutlet UILabel *loginlabel;
@property (weak, nonatomic) IBOutlet UITextField *t1;
@property (weak, nonatomic) IBOutlet UITextField *t2;
@property(nonatomic, copy) NSAttributedString *attributedPlaceholder;

@end
