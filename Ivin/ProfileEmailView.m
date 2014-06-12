//
//  ProfileEmailView.m
//  Ivin
//
//  Created by user on 3/26/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "ProfileEmailView.h"

@interface ProfileEmailView ()

@end

@implementation ProfileEmailView

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
    self.text.layer.borderWidth =1.0;
    self.text.layer.cornerRadius =5.0;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
