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
