//
//  VinViewController.m
//  Ivin
//
//  Created by user on 6/10/14.
//  Copyright (c) 2014 user. All rights reserved.
//
#import "UIImage+Network.h"
#import "QRViewController.h"
#import "SingletonClass.h"


@interface QRViewController ()
@property (strong) UIActivityIndicatorView *activityIndicator;

@end

BOOL isFullScreen,loding;
CGRect prevFrame;

@implementation QRViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}





-(void)loadima
{
    NSString *somestring=[SingletonClass sharedInstance].wine.QRCodePictureUrl;
    [_ima loadImageFromURL:[NSURL URLWithString:somestring] placeholderImage:nil cachingKey:somestring];
    _ima.contentMode=UIViewContentModeScaleAspectFit;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor clearColor];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] init];
    barButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = barButtonItem;
    [self performSelectorOnMainThread:@selector(loadima) withObject:nil waitUntilDone:NO];

}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
