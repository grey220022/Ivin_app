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
#import "ContactViewController.h"
#import "FTWCache.h"


@interface WineryViewController ()
@property (strong) UIActivityIndicatorView *activityIndicator;

@end

BOOL isFullScreen,loding;
CGRect prevFrame;


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
    
    [_ima loadImageFromURL:[NSURL URLWithString:somestring] placeholderImage:nil cachingKey:somestring];
    _ima.contentMode=UIViewContentModeScaleAspectFit;
    [_activityIndicator stopAnimating];
    loding=false;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] init];
    barButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = barButtonItem;
    
    isFullScreen = false;
    loding=true;
    [self.view bringSubviewToFront:_ima];
    _ima.userInteractionEnabled = YES;
    UITapGestureRecognizer *pgr = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(imgToFullScreen:)];
    pgr.delegate = self;
    [_ima addGestureRecognizer:pgr];

    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scalePiece:)];
    [pinchGesture setDelegate:self];
    [_ima addGestureRecognizer:pinchGesture];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panPiece:)];
    [pinchGesture setDelegate:self];
    [_ima addGestureRecognizer:panGesture];

    
    self.view.backgroundColor=[UIColor blackColor];
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
        
        [self ios6move:_f1];
        [self ios6move:_f2];
        [self ios6move:_f3];
        [self ios6move:_f4];
        [self ios6move:_f5];
        
    }

    
}


/*
-(void)viewWillAppear:(BOOL)animated
{
    
}
*/
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (isFullScreen)
    {
    [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
        [_ima setFrame:prevFrame];
    }completion:^(BOOL finished){
        isFullScreen = false;
        _b1.hidden=false;
        _b2.hidden=false;
        _b3.hidden=false;
        _b4.hidden=false;
        _b5.hidden=false;
        
        _ll1.hidden=false;
        _ll2.hidden=false;
        _ll3.hidden=false;
        _ll4.hidden=false;
        _ll5.hidden=false;
        
        _f1.hidden=false;
        _f2.hidden=false;
        _f3.hidden=false;
        _f4.hidden=false;
        _f5.hidden=false;
        
    }];
    }
    
    //NSString * aa=[IvinHelp md5HexDigest:@"123456789"];
    
    //NSLog(@"%@",aa);
    
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
    ContactViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"contactview"];
    [self.navigationController pushViewController:nextController animated:YES];
    /*
     nextController.title=[words getword:@"contact"];
     nextController.contenttype=@"contact";
     */
    nextController.title=[words getword:@"bc5"];
    //nextController.contenttype=@"bc5";
    //nextController.imageurl=@"NOIMG";
}

-(void)ios6move: (UIView *)u
{
    CGPoint point =CGPointMake(0, u.frame.origin.y-65);
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

- (void)imgToFullScreen:(UITapGestureRecognizer *)pinchGestureRecognizer
{
    NSLog(@"aafds");
    if ((!isFullScreen)&&(loding==false)) {
        [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
            //save previous frame
            prevFrame = _ima.frame;
            
            
            [_ima setFrame:[[UIScreen mainScreen] bounds]];
        }completion:^(BOOL finished){
            isFullScreen = true;
            _b1.hidden=true;
            _b2.hidden=true;
            _b3.hidden=true;
            _b4.hidden=true;
            _b5.hidden=true;
            
            _ll1.hidden=true;
            _ll2.hidden=true;
            _ll3.hidden=true;
            _ll4.hidden=true;
            _ll5.hidden=true;
            _f1.hidden=true;
            _f2.hidden=true;
            _f3.hidden=true;
            _f4.hidden=true;
            _f5.hidden=true;
            

        }];
        return;
    } else {
        [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
            [_ima setFrame:prevFrame];
        }completion:^(BOOL finished){
            isFullScreen = false;
            _b1.hidden=false;
            _b2.hidden=false;
            _b3.hidden=false;
            _b4.hidden=false;
            _b5.hidden=false;
            
            _ll1.hidden=false;
            _ll2.hidden=false;
            _ll3.hidden=false;
            _ll4.hidden=false;
            _ll5.hidden=false;
            
            _f1.hidden=false;
            _f2.hidden=false;
            _f3.hidden=false;
            _f4.hidden=false;
            _f5.hidden=false;

        }];
        return;
    }
}
- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        UIView *piece = gestureRecognizer.view;
        CGPoint locationInView = [gestureRecognizer locationInView:piece];
        CGPoint locationInSuperview = [gestureRecognizer locationInView:piece.superview];
        
        piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
        piece.center = locationInSuperview;
    }
}


- (void)scalePiece:(UIPinchGestureRecognizer *)gestureRecognizer {
    if (!isFullScreen)
        return;
    [self adjustAnchorPointForGestureRecognizer:gestureRecognizer];
    
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan || [gestureRecognizer state] == UIGestureRecognizerStateChanged) {
        [gestureRecognizer view].transform = CGAffineTransformScale([[gestureRecognizer view] transform], [gestureRecognizer scale], [gestureRecognizer scale]);
        [gestureRecognizer setScale:1];
    }
}

- (void)panPiece:(UIPanGestureRecognizer *)gestureRecognizer
{
    if (!isFullScreen)
        return;
    UIView *piece = [gestureRecognizer view];
    
    [self adjustAnchorPointForGestureRecognizer:gestureRecognizer];
    
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan || [gestureRecognizer state] == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:[piece superview]];
        
        [piece setCenter:CGPointMake([piece center].x + translation.x, [piece center].y + translation.y)];
        [gestureRecognizer setTranslation:CGPointZero inView:[piece superview]];
    }
}



@end
