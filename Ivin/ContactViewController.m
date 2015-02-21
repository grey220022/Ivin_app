//
//  ContactViewController.m
//  Ivin
//
//  Created by user on 3/1/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "UIImage+Network.h"
#import "ContactViewController.h"
#import "FormTableController.h"
#import "RegisterFormTableController.h"
#import "WineView.h"
#import "CommentView.h"
#import "ProfileView.h"
#import "DetailView.h"
#import "words.h"
#import "SingletonClass.h"
#import "words.h"
#import "VinViewController.h"
#import "WineryViewController.h"
#import "GrapeViewController.h"
#import "IvinHelp.h"
#import "QRViewController.h"

@interface ContactViewController ()

@end



@implementation ContactViewController




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
    
    self.view.backgroundColor=[UIColor clearColor];
    self.navigationItem.title=[words getword:@"bc5"];//[SingletonClass sharedInstance].winery.Name;
    [_sw setScrollEnabled:YES];
    [_sw setContentSize:CGSizeMake(320, 620)];
    
    
    if([UIScreen mainScreen].bounds.size.height < 568){
        
        CGPoint point =CGPointMake(0, -23.0);
        CGRect frame = _sw.frame;
        frame.origin = point;
        _sw.frame=frame;
    }
    
    
    _sw.delegate=self;
    [_iw loadImageFromURL:[NSURL URLWithString:[SingletonClass sharedInstance].winery.WineryPhotoUrl] placeholderImage:nil cachingKey:[SingletonClass sharedInstance].winery.WineryPhotoUrl];
    _iw.contentMode=UIViewContentModeScaleAspectFit;
    

    
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end