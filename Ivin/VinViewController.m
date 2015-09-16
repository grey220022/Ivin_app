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
NSString *text1, *text2, *text3, *text4, *text5;

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
    NSString *somestring=[SingletonClass sharedInstance].wine.WinePhotoUrl;
    [_ima loadImageFromURL:[NSURL URLWithString:somestring] placeholderImage:nil cachingKey:somestring];
    _ima.contentMode=UIViewContentModeScaleAspectFit;
    [_activityIndicator stopAnimating];
    loding=false;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
    isFullScreen = false;
    loding=true;
    [self.view bringSubviewToFront:_ima];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] init];
    barButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = barButtonItem;
    [_b1 setTitle:[words getword:@"bi1"] forState:UIControlStateNormal];
    [_b2 setTitle:[words getword:@"bi2"] forState:UIControlStateNormal];
    [_b3 setTitle:[words getword:@"bi3"] forState:UIControlStateNormal];
    [_b4 setTitle:[words getword:@"bi4"] forState:UIControlStateNormal];
    [_b5 setTitle:[words getword:@"bi5"] forState:UIControlStateNormal];

    [self performSelectorOnMainThread:@selector(loadima) withObject:nil waitUntilDone:NO];
    
    
    
    _ima.userInteractionEnabled = NO;
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
    
    
    
    text1=[SingletonClass sharedInstance].wine.bi1;
    text2=[SingletonClass sharedInstance].wine.bi2;
    text3=[SingletonClass sharedInstance].wine.bi3;
    text4=[SingletonClass sharedInstance].wine.bi4;
    text5=[SingletonClass sharedInstance].wine.bi5;
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    int currentpos=408;

    if (!(text1 == nil || [text1 isKindOfClass:[NSNull class]]|| [text1 isEqualToString:@""]))
    {
        CGRect btFrame = _ll1.frame;
        btFrame.origin.x = 0;
        btFrame.origin.y = currentpos;
        _ll1.frame = btFrame;
        currentpos+=20;
        
        btFrame = _b1.frame;
        btFrame.origin.x = 0;
        btFrame.origin.y = currentpos;
        _b1.frame = btFrame;
        currentpos+=50;
        UILabel  * label = [[UILabel alloc] initWithFrame:CGRectMake(0, currentpos, screenWidth, 100)];
        label.numberOfLines=0;
        label.lineBreakMode=NSLineBreakByWordWrapping;
        CGSize maximumLabelSize = CGSizeMake(screenWidth, FLT_MAX);
        CGSize expectedLabelSize = [text1 sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
        CGRect newFrame = label.frame;
        newFrame.size.height = expectedLabelSize.height;
        label.frame = newFrame;
        currentpos+=newFrame.size.height;
        [_sw addSubview:label];
        label.text=text1;
        label.textColor=[UIColor whiteColor];
    }
    
    else{
        _b1.hidden=YES;
        _ll1.hidden=YES;
    }

    if (!(text2 == nil || [text2 isKindOfClass:[NSNull class]] || [text2 isEqualToString:@""] ))
    {
        CGRect btFrame = _ll2.frame;
        btFrame.origin.x = 0;
        btFrame.origin.y = currentpos;
        _ll2.frame = btFrame;
        currentpos+=20;
        btFrame = _b2.frame;
        btFrame.origin.x = 0;
        btFrame.origin.y = currentpos;
        _b2.frame = btFrame;
        currentpos+=50;
        UILabel  * label = [[UILabel alloc] initWithFrame:CGRectMake(0, currentpos, screenWidth, 100)];
        label.numberOfLines=0;
        label.lineBreakMode=NSLineBreakByWordWrapping;
        CGSize maximumLabelSize = CGSizeMake(screenWidth, FLT_MAX);
        CGSize expectedLabelSize = [text2 sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
        CGRect newFrame = label.frame;
        newFrame.size.height = expectedLabelSize.height;
        label.frame = newFrame;
        currentpos+=newFrame.size.height;
        [_sw addSubview:label];
        label.text=text2;
        label.textColor=[UIColor whiteColor];
    }
    else{
        _b2.hidden=YES;
        _ll2.hidden=YES;
    }
    
    if (!(text3 == nil || [text3 isKindOfClass:[NSNull class]]|| [text3 isEqualToString:@""]))
    {
        CGRect btFrame = _ll3.frame;
        btFrame.origin.x = 0;
        btFrame.origin.y = currentpos;
        _ll3.frame = btFrame;
        currentpos+=20;
        btFrame = _b3.frame;
        btFrame.origin.x = 0;
        btFrame.origin.y = currentpos;
        _b3.frame = btFrame;
        currentpos+=50;
        UILabel  * label = [[UILabel alloc] initWithFrame:CGRectMake(0, currentpos, screenWidth, 100)];
        label.numberOfLines=0;
        label.lineBreakMode=NSLineBreakByWordWrapping;
        CGSize maximumLabelSize = CGSizeMake(screenWidth, FLT_MAX);
        CGSize expectedLabelSize = [text3 sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
        CGRect newFrame = label.frame;
        newFrame.size.height = expectedLabelSize.height;
        label.frame = newFrame;
        currentpos+=newFrame.size.height;
        [_sw addSubview:label];
        label.text=text3;
        label.textColor=[UIColor whiteColor];
    }
    else{
        _b3.hidden=YES;
        _ll3.hidden=YES;
    }
    
    if (!(text4 == nil || [text4 isKindOfClass:[NSNull class]]|| [text4 isEqualToString:@""]))
    {
        CGRect btFrame = _ll4.frame;
        btFrame.origin.x = 0;
        btFrame.origin.y = currentpos;
        _ll4.frame = btFrame;
        currentpos+=20;
        btFrame = _b4.frame;
        btFrame.origin.x = 0;
        btFrame.origin.y = currentpos;
        _b4.frame = btFrame;
        currentpos+=50;
        UILabel  * label = [[UILabel alloc] initWithFrame:CGRectMake(0, currentpos, screenWidth, 100)];
        label.numberOfLines=0;
        label.lineBreakMode=NSLineBreakByWordWrapping;
        CGSize maximumLabelSize = CGSizeMake(screenWidth, FLT_MAX);
        CGSize expectedLabelSize = [text4 sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
        CGRect newFrame = label.frame;
        newFrame.size.height = expectedLabelSize.height;
        label.frame = newFrame;
        currentpos+=newFrame.size.height;
        [_sw addSubview:label];
        label.text=text4;
        label.textColor=[UIColor whiteColor];
    }
    else{
        _b4.hidden=YES;
        _ll4.hidden=YES;
    }
    
    if (!(text5 == nil || [text5 isKindOfClass:[NSNull class]]|| [text5 isEqualToString:@""]))
    {
        CGRect btFrame = _ll5.frame;
        btFrame.origin.x = 0;
        btFrame.origin.y = currentpos;
        _ll5.frame = btFrame;
        currentpos+=20;
        btFrame = _b5.frame;
        btFrame.origin.x = 0;
        btFrame.origin.y = currentpos;
        _b5.frame = btFrame;
        currentpos+=50;
        UILabel  * label = [[UILabel alloc] initWithFrame:CGRectMake(0, currentpos, screenWidth, 100)];
        label.numberOfLines=0;
        label.lineBreakMode=NSLineBreakByWordWrapping;
        CGSize maximumLabelSize = CGSizeMake(screenWidth, FLT_MAX);
        CGSize expectedLabelSize = [text5 sizeWithFont:label.font constrainedToSize:maximumLabelSize lineBreakMode:label.lineBreakMode];
        CGRect newFrame = label.frame;
        newFrame.size.height = expectedLabelSize.height;
        label.frame = newFrame;
        currentpos+=newFrame.size.height;
        [_sw addSubview:label];
        label.text=text5;
        label.textColor=[UIColor whiteColor];
    }
    else{
        _b5.hidden=YES;
        _ll5.hidden=YES;
    }
    
    [_sw setScrollEnabled:YES];
    [_sw setContentSize:CGSizeMake(320, currentpos+100)];

}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
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
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
-(IBAction) b1_push
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ContentViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"contentview"];
    [self.navigationController pushViewController:nextController animated:YES];
    nextController.title=[words getword:@"bi1"];
    nextController.contenttype=@"bi1";
    nextController.imageurl=@"NOIMG";
}

-(IBAction) b2_push
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ContentViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"contentview"];
    [self.navigationController pushViewController:nextController animated:YES];
    nextController.title=[words getword:@"bi2"];
    nextController.contenttype=@"bi2";
    nextController.imageurl=@"NOIMG";
}

-(IBAction) b3_push
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ContentViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"contentview"];
    [self.navigationController pushViewController:nextController animated:YES];
    nextController.title=[words getword:@"bi3"];
    nextController.contenttype=@"bi3";
    nextController.imageurl=@"NOIMG";

}

-(IBAction) b4_push
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ContentViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"contentview"];
    [self.navigationController pushViewController:nextController animated:YES];
    nextController.title=[words getword:@"bi4"];
    nextController.contenttype=@"bi4";
    nextController.imageurl=@"NOIMG";
}

-(IBAction) b5_push
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ContentViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"contentview"];
    [self.navigationController pushViewController:nextController animated:YES];
    nextController.title=[words getword:@"bi5"];
    nextController.contenttype=@"bi5";
    nextController.imageurl=@"NOIMG";
}

*/

-(void)ios6move: (UIView *)u
{
    CGPoint point =CGPointMake(0, u.frame.origin.y-65);
    CGRect frame = u.frame;
    frame.origin=point;
    u.frame=frame;
}



-(void)ios6newmove: (UIView *)u
{
    CGPoint point =CGPointMake(u.frame.origin.x, u.frame.origin.y-65);
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
