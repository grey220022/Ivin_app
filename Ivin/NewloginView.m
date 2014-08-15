//
//  NewloginView.m
//  Ivin
//
//  Created by user on 8/12/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "NewloginView.h"
#import "NewuserView.h"

@interface NewloginView ()

@end

@implementation NewloginView



-(IBAction) cancelbutton
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(IBAction) loginbutton
{
//    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction) signupbutton
{
    NSLog(@"signupbutton press");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NewuserView *newuserview = [storyboard instantiateViewControllerWithIdentifier:@"newuserview"];
    [self presentModalViewController:newuserview animated:YES];
}


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
    _loginlabel.text=@"Login";

	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
