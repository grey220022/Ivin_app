//
//  SignView.m
//  Ivin
//
//  Created by user on 3/25/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "SignView.h"

@interface SignView ()

@end

@implementation SignView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)click1
{
    [self.text resignFirstResponder];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.text.layer.borderWidth =1.0;
    self.text.layer.cornerRadius =5.0;
    [self.text setContentInset:UIEdgeInsetsMake(-45, 0, 5,0)];
    self.navigationItem.title=@"个性签名";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];
    
    UITapGestureRecognizer* gesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click1)];
    [self.view setUserInteractionEnabled:YES];
    [self.view addGestureRecognizer:gesture1];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
