//
//  ProfileCityView.m
//  Ivin
//
//  Created by user on 3/26/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "ProfileCityView.h"

@interface ProfileCityView ()

@end

@implementation ProfileCityView

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
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
