//
//  SetupView.m
//  Ivin
//
//  Created by user on 8/16/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "SetupView.h"
#import "words.h"
#import "SendViewController.h"
#import "NewloginView.h"
#import "LangView.h"
#import "ProfileView.h"


@interface SetupView ()

@end

@implementation SetupView

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
	// Do any additional setup after loading the view.
    
    self.navigationItem.title=@"设置";
    //self.navigationController.
    [_li3 setTitle:[words getword:@"userlogin"] forState:UIControlStateNormal];
    [_li4 setTitle:[words getword:@"website"] forState:UIControlStateNormal];
    [_li5 setTitle:[words getword:@"feedback"] forState:UIControlStateNormal];
    [_li6 setTitle:[words getword:@"storerating"] forState:UIControlStateNormal];
    [_li7 setTitle:[words getword:@"about"] forState:UIControlStateNormal];
    [_li8 setTitle:[words getword:@"lang"] forState:UIControlStateNormal];
    
    
    [_li1 setTitle:  @"Huiqi" forState:UIControlStateNormal];
    //[_li1 setTitle:  [words getword:@"photo"] forState:UIControlStateNormal];
    //[_li2 setTitle:[words getword:@"profile"] forState:UIControlStateNormal];
    
    
    [_li1 setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 100, 0.0, 0.0)];
    [_li2 setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 10, 0.0, 0.0)];
    [_li3 setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 10, 0.0, 0.0)];
    [_li4 setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 10, 0.0, 0.0)];
    [_li5 setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 10, 0.0, 0.0)];
    [_li6 setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 10, 0.0, 0.0)];
    [_li7 setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 10, 0.0, 0.0)];
    [_li8 setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 10, 0.0, 0.0)];
    
    [_li1 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [_li2 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [_li3 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [_li4 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [_li5 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [_li6 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [_li7 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [_li8 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
}


-(IBAction)profilepress
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ProfileView *nextController = [storyboard instantiateViewControllerWithIdentifier:@"profileview"];
    nextController.title=@"帐户信息";
    [self.navigationController pushViewController:nextController animated:YES];
}

-(IBAction)loginpress
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NewloginView *newloginview = [storyboard instantiateViewControllerWithIdentifier:@"newloginview"];
    
    [self presentModalViewController:newloginview animated:YES];
    
    
}
-(IBAction)websitepress
{
    
}

-(IBAction)feedbackpress
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SendViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"sendview"];
    [self presentModalViewController:vc animated:NO];
}

-(IBAction)appratingpress
{
    
}

-(IBAction)aboutpress
{
    UIAlertView *myAlertView;
    myAlertView = [[UIAlertView alloc]initWithTitle:@"制作团队" message:@"巴黎酒社团队制作" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [myAlertView show];
}

-(IBAction)languagepress
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LangView *nextController = [storyboard instantiateViewControllerWithIdentifier:@"langview"];
    nextController.title=[words getword:@"lang"];
    [self.navigationController pushViewController:nextController animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
