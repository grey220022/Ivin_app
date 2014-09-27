//
//  WineryViewController.m
//  Ivin
//
//  Created by user on 6/10/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "WineryViewController.h"
#import "words.h"
#import "ContentViewController.h"
#import "SingletonClass.h"
#import "UIImage+Network.h"
#import "IvinHelp.h"

@interface WineryViewController ()
@property (strong) UIActivityIndicatorView *activityIndicator;

@end

@implementation WineryViewController

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
    NSString *somestring=[SingletonClass sharedInstance].winery.WineryPhotoUrl;
    
    //UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:somestring]]];
    
    //UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.ivindigital.com/content/images/carte/chateau.png"]]];
    //_ima.image=image;
    
    [_ima loadImageFromURL:[NSURL URLWithString:somestring] placeholderImage:nil cachingKey:@"iwinerycache"];
    _ima.contentMode=UIViewContentModeScaleAspectFit;
    [_activityIndicator stopAnimating];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] init];
    barButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = barButtonItem;
    
    
    self.view.backgroundColor=[UIColor clearColor];
    //self.title=@"string";
    /*
     [_b1 setTitle:[words getword:@"winery"] forState:UIControlStateNormal];
     [_b2 setTitle:[words getword:@"winemaker"] forState:UIControlStateNormal];
     [_b3 setTitle:[words getword:@"wineyard"] forState:UIControlStateNormal];
     [_b4 setTitle:[words getword:@"winetourism"] forState:UIControlStateNormal];
     [_b5 setTitle:[words getword:@"contact"] forState:UIControlStateNormal];
     */
    [_b1 setTitle:[words getword:@"bc1"] forState:UIControlStateNormal];
    [_b2 setTitle:[words getword:@"bc2"] forState:UIControlStateNormal];
    [_b3 setTitle:[words getword:@"bc3"] forState:UIControlStateNormal];
    [_b4 setTitle:[words getword:@"bc4"] forState:UIControlStateNormal];
    [_b5 setTitle:[words getword:@"bc5"] forState:UIControlStateNormal];
    
    
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



-(void)viewWillAppear:(BOOL)animated
{
    
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
     nextController.title=[words getword:@"winery"];
     
     
     //nextController.img=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wine.jpg"]];
     
     nextController.contenttype=@"winery";
     */
    //nextController.title=[words getword:@"bc1"];
    nextController.contenttype=@"bc1";
    nextController.imageurl=[SingletonClass sharedInstance].winery.WineryPhotoUrl;
    //    nextController.title=[SingletonClass sharedInstance].winery.DescriptionTitle;
    nextController.title=  [IvinHelp strval:[SingletonClass sharedInstance].winery.DescriptionTitle replacevalue:[words getword:@"bc1"]];
    
}

-(IBAction) b2_push
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ContentViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"contentview"];
    
    [self.navigationController pushViewController:nextController animated:YES];
    /*
     nextController.title=[SingletonClass sharedInstance].winery.OtherHistory;//[words getword:@"winemaker"];
     nextController.contenttype=@"winemaker";
     */
    //nextController.title=[words getword:@"bc2"];
    nextController.contenttype=@"bc2";
    nextController.imageurl=[SingletonClass sharedInstance].winery.OwnerDescriptionPhotoUrl;
    //nextController.title=[SingletonClass sharedInstance].winery.OwnerDescriptionTitle;
    nextController.title=  [IvinHelp strval:[SingletonClass sharedInstance].winery.OwnerDescriptionTitle replacevalue:[words getword:@"bc2"]];
    
}

-(IBAction) b3_push
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ContentViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"contentview"];
    [self.navigationController pushViewController:nextController animated:YES];
    /*
     nextController.title=[words getword:@"wineyard"];
     nextController.contenttype=@"wineyard";
     */
    nextController.title=[words getword:@"bc3"];
    nextController.contenttype=@"bc3";
    nextController.imageurl=[SingletonClass sharedInstance].winery.VineyardPresentationPhotoUrl;
    //    nextController.title=[SingletonClass sharedInstance].winery.VineyardPresentationTitle;
    
    
    nextController.title=  [IvinHelp strval:[SingletonClass sharedInstance].winery.VineyardPresentationTitle replacevalue:[words getword:@"bc3"]];
    
}

-(IBAction) b4_push
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ContentViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"contentview"];
    [self.navigationController pushViewController:nextController animated:YES];
    nextController.contenttype=@"bc4";
    nextController.imageurl=[SingletonClass sharedInstance].winery.WinetoursPhotoUrl;
    nextController.title=  [IvinHelp strval:[SingletonClass sharedInstance].winery.WinetoursTitle replacevalue:[words getword:@"bc4"]];
}

-(IBAction) b5_push
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ContentViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"contentview"];
    [self.navigationController pushViewController:nextController animated:YES];
    /*
     nextController.title=[words getword:@"contact"];
     nextController.contenttype=@"contact";
     */
    nextController.title=[words getword:@"bc5"];
    nextController.contenttype=@"bc5";
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
