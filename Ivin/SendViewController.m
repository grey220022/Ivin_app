//
//  SendViewController.m
//  Ivin
//
//  Created by user on 3/9/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "SendViewController.h"

@interface SendViewController ()

@end



@implementation SendViewController

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/
- (void)viewDidLoad
{
    self.text.layer.borderWidth =1.0;
    self.text.layer.cornerRadius =5.0;
    [super viewDidLoad];
    NSLog(@"load");
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)finish_button:(id)sender
{
    NSLog(@"Hello");
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
