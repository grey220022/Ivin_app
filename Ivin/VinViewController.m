//
//  VinViewController.m
//  Ivin
//
//  Created by user on 6/10/14.
//  Copyright (c) 2014 user. All rights reserved.
//
#import "UIImage+Network.h"
#import "VinViewController.h"
#import "words.h"
#import "ContentViewController.h"
#import "SingletonClass.h"


@interface VinViewController ()
@property (strong) UIActivityIndicatorView *activityIndicator;

@end

@implementation VinViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



-(void)actIndicatorBegin
{
    [_activityIndicator startAnimating];
}


-(void)loadima
{
    [NSThread detachNewThreadSelector: @selector(actIndicatorBegin) toTarget:self withObject:nil];
    NSString *somestring=[SingletonClass sharedInstance].wine.WinePhotoUrl;//.PictureName;
    
    
//    UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:somestring]]];
    
    //UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.ivindigital.com/content/images/carte/chateau.png"]]];
    
    
    [_ima loadImageFromURL:[NSURL URLWithString:somestring] placeholderImage:nil cachingKey:somestring];

    
   // _ima.image=image;
    _ima.contentMode=UIViewContentModeScaleAspectFit;
    [_activityIndicator stopAnimating];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor clearColor];
    
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] init];
    barButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = barButtonItem;


//    words getword:@"thewine"],[words getword:@"winetasting"],[words getword:@"winemaking"]

    /*
    [_b1 setTitle:[words getword:@"thewine"] forState:UIControlStateNormal];
    [_b2 setTitle:[words getword:@"winetasting"] forState:UIControlStateNormal];
    [_b3 setTitle:[words getword:@"winemaking"] forState:UIControlStateNormal];
    [_b4 setTitle:[words getword:@"advice"] forState:UIControlStateNormal];
    */
    [_b1 setTitle:[words getword:@"bi1"] forState:UIControlStateNormal];
    [_b2 setTitle:[words getword:@"bi2"] forState:UIControlStateNormal];
    [_b3 setTitle:[words getword:@"bi3"] forState:UIControlStateNormal];
    [_b4 setTitle:[words getword:@"bi4"] forState:UIControlStateNormal];
    [_b5 setTitle:[words getword:@"bi5"] forState:UIControlStateNormal];

    
    /*
    _activityIndicator = [[UIActivityIndicatorView alloc]
                          initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    [_activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:_activityIndicator];
    _activityIndicator.center=CGPointMake(160, 250);
    _activityIndicator.hidesWhenStopped = YES;
     */
    [self performSelectorOnMainThread:@selector(loadima) withObject:nil waitUntilDone:NO];
    
    if([UIScreen mainScreen].bounds.size.height < 568){
        [self ios6move:_b1];
        [self ios6move:_b2];
        [self ios6move:_b3];
        [self ios6move:_b4];
        [self ios6move:_b5];
        
        [self ios6move:_ll1];
        [self ios6move:_ll2];
        [self ios6move:_ll3];
        [self ios6move:_ll4];
        [self ios6move:_ll5];
        [self ios6posmove:_ima];
        
    }

}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction) b1_push
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ContentViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"contentview"];
    [self.navigationController pushViewController:nextController animated:YES];
    /*
    nextController.title=[words getword:@"thewine"];
    nextController.contenttype=@"thewine";
     */
    nextController.title=[words getword:@"bi1"];
    nextController.contenttype=@"bi1";
    nextController.imageurl=@"NOIMG";
}

-(IBAction) b2_push
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ContentViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"contentview"];
    [self.navigationController pushViewController:nextController animated:YES];
    /*
    nextController.title=[words getword:@"winetasting"];
    nextController.contenttype=@"winetasting";
     */
    nextController.title=[words getword:@"bi2"];
    nextController.contenttype=@"bi2";
    nextController.imageurl=@"NOIMG";
}

-(IBAction) b3_push
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ContentViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"contentview"];
    [self.navigationController pushViewController:nextController animated:YES];
    /*
    nextController.title=[words getword:@"winemaking"];
    nextController.contenttype=@"winemaking";
     */
    nextController.title=[words getword:@"bi3"];
    nextController.contenttype=@"bi3";
    nextController.imageurl=@"NOIMG";

}

-(IBAction) b4_push
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ContentViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"contentview"];
    [self.navigationController pushViewController:nextController animated:YES];
    /*
    nextController.title=[words getword:@"advice"];
    nextController.contenttype=@"advice";
     */
    nextController.title=[words getword:@"bi4"];
    nextController.contenttype=@"bi4";
    nextController.imageurl=@"NOIMG";
}

-(IBAction) b5_push
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ContentViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"contentview"];
    [self.navigationController pushViewController:nextController animated:YES];
    /*
    nextController.title=[words getword:@"advice"];
    nextController.contenttype=@"advice";
     */
    nextController.title=[words getword:@"bi5"];
    nextController.contenttype=@"bi5";
    nextController.imageurl=@"NOIMG";
}



-(void)ios6move: (UIView *)u
{
    CGPoint point =CGPointMake(0, u.frame.origin.y-30);
    CGRect frame = u.frame;
    frame.origin=point;
    u.frame=frame;
}


-(void)ios6posmove: (UIView *)u
{
    CGPoint point =CGPointMake(0, u.frame.origin.y+20);
    CGRect frame = u.frame;
    frame.origin=point;
    u.frame=frame;
}

@end
