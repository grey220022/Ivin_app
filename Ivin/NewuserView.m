//
//  NewuserView.m
//  Ivin
//
//  Created by user on 8/12/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "NewuserView.h"

@interface NewuserView ()

@end

@implementation NewuserView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _signuplabel.text=@"Sign up";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];
    
    _t1.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    _t1.leftViewMode = UITextFieldViewModeAlways;
    
    _t2.leftView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    _t2.leftViewMode = UITextFieldViewModeAlways;
    
    _t3.leftView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    _t3.leftViewMode = UITextFieldViewModeAlways;
    
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"Username" attributes:@{ NSForegroundColorAttributeName : [UIColor grayColor] }];
    self.t1.attributedPlaceholder = str;
    
    NSAttributedString *str2 = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{ NSForegroundColorAttributeName : [UIColor grayColor] }];
    self.t2.attributedPlaceholder = str2;
    
    NSAttributedString *str3 = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{ NSForegroundColorAttributeName : [UIColor grayColor] }];
    self.t3.attributedPlaceholder = str3;
    
    _t1.delegate=self;
    _t2.delegate=self;
    _t3.delegate=self;

    _t2.secureTextEntry=YES;
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}


-(IBAction) cancelbutton
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction) signupbutton
{
//    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"signup button pressed");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
