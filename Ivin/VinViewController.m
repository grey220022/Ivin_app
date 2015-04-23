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

BOOL isFullScreen,loding;
CGRect prevFrame;

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
    loding=false;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor clearColor];
    isFullScreen = false;
    loding=true;
    [self.view bringSubviewToFront:_ima];
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
    }];
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
