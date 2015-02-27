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

NSString * t1, *t2, *t3, *t4, *t5, *t6, *t7;


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
    
    
    //_sw.delegate=self;
    [_iw loadImageFromURL:[NSURL URLWithString:[SingletonClass sharedInstance].winery.WineryPhotoUrl] placeholderImage:nil cachingKey:[SingletonClass sharedInstance].winery.WineryPhotoUrl];
    _iw.contentMode=UIViewContentModeScaleAspectFit;

    
    
    t1=[IvinHelp  strval:[SingletonClass sharedInstance].winery.WebSite replacevalue:@""];
    t2=[IvinHelp  strval:[SingletonClass sharedInstance].winery.Phone replacevalue:@""];
    t3=[IvinHelp  strval:[SingletonClass sharedInstance].winery.Address replacevalue:@""];
    t4=[IvinHelp  strval:[SingletonClass sharedInstance].winery.Mail replacevalue:@""];
    t5=[IvinHelp  strval:[SingletonClass sharedInstance].winery.Fax replacevalue:@""];
    t6=[IvinHelp  strval:[SingletonClass sharedInstance].winery.Facebook replacevalue:@""];
    t7=[IvinHelp  strval:[SingletonClass sharedInstance].winery.Wechat replacevalue:@""];
    
    [_b1 setTitle:t1 forState:UIControlStateNormal];
    [_b2 setTitle:t2 forState:UIControlStateNormal];
    [_b3 setTitle:t3 forState:UIControlStateNormal];
    [_b4 setTitle:t4 forState:UIControlStateNormal];
    [_b5 setTitle:t5 forState:UIControlStateNormal];
    [_b6 setTitle:t6 forState:UIControlStateNormal];
    [_b7 setTitle:t7 forState:UIControlStateNormal];
    
    [_b1 setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    [_b2 setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    [_b3 setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    [_b4 setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    [_b5 setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    [_b6 setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    [_b7 setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    
    _b1.backgroundColor = [UIColor blackColor];
    _b2.backgroundColor = [UIColor blackColor];
    _b3.backgroundColor = [UIColor blackColor];
    _b4.backgroundColor = [UIColor blackColor];
    _b5.backgroundColor = [UIColor blackColor];
    _b6.backgroundColor = [UIColor blackColor];
    _b7.backgroundColor = [UIColor blackColor];

    _b1.layer.borderWidth = 0.0;
    _b2.layer.borderWidth = 0.0;
    _b3.layer.borderWidth = 0.0;
    _b4.layer.borderWidth = 0.0;
    _b5.layer.borderWidth = 0.0;
    _b6.layer.borderWidth = 0.0;
    _b7.layer.borderWidth = 0.0;
    [_b1 addTarget:self action:@selector(b1click) forControlEvents: UIControlEventTouchUpInside];
    [_b2 addTarget:self action:@selector(b2click) forControlEvents: UIControlEventTouchUpInside];
    [_b6 addTarget:self action:@selector(b6click) forControlEvents: UIControlEventTouchUpInside];
    [_b7 addTarget:self action:@selector(b7click) forControlEvents: UIControlEventTouchUpInside];

}

-(IBAction) b1click
{
    if (t1.length>3)
    {
        
        if ([t1 rangeOfString:@"http"].location == NSNotFound) {
            t1 = [@"http://" stringByAppendingString:t1];
        }
      [[UIApplication sharedApplication] openURL:[NSURL URLWithString: t1]];
    }
}

-(IBAction) b2click
{
    if (t2.length>3)
    {
        NSString *phoneNumber = [@"telprompt://" stringByAppendingString:t2];
        
        phoneNumber=[phoneNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
        phoneNumber=[phoneNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
        phoneNumber=[phoneNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
        phoneNumber=[phoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
       // NSLog(phoneNumber);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    }
    
}

-(IBAction) b6click
{
    if (t6.length>3)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: t6]];
    }
    
}

-(IBAction) b7click
{
    if (t7.length>3)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: t7]];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end