//
//  ContentViewController.m
//  Ivin
//
//  Created by user on 6/16/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "ContentViewController.h"
#import "SingletonClass.h"
#import "UIImage+Network.h"
#import "SalonViewController.h"

@interface ContentViewController ()

@end

BOOL isFullScreen,loding;
CGRect prevFrame;


@implementation ContentViewController

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
    
    
    
    /*
     UIButton *titleLabel = [UIButton buttonWithType:UIButtonTypeCustom];
     [titleLabel setTitle:@"" forState:UIControlStateNormal];
     titleLabel.frame = CGRectMake(0, 0, 70, 44);
     titleLabel.font = [UIFont boldSystemFontOfSize:2];
     [titleLabel setTitleColor:[UIColor colorWithRed:235.0f/255.0f green:216.0f/255.0f blue:145.0f/255.0f alpha:1.0f] forState:UIControlStateNormal];
     self.navigationItem.backBarButtonItem. = titleLabel;
     */
    // UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] init];
    // barButtonItem.title = @"buttonName";
    // self.navigationItem.backBarButtonItem = barButtonItem;
    
    
    
    _content.numberOfLines = 3;
    
    self.view.backgroundColor=[UIColor blackColor];
    
    self.content1.backgroundColor=[UIColor blackColor];
    
    //    self.imge=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wine.jpg"]];
    //NSString *somestring=[SingletonClass sharedInstance].wine.PictureName;
    //    UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:somestring]]];
    
    //UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.ivindigital.com/content/images/carte/chateau.png"]]];
    
    
    if ([_imageurl isEqual:@"NOIMG"])
    {
        self.ima.hidden=YES;
        [self.content1 setFrame:CGRectMake(20,68,285, 430)];
    }
    else
    {
        self.ima.contentMode=UIViewContentModeScaleAspectFit;
        [self.ima loadImageFromURL:[NSURL URLWithString:_imageurl] placeholderImage:nil cachingKey:_imageurl];
    }
    
    // _ima.image=image;
    
    /*
     UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
     
     imgView.image = [UIImage imageNamed:@"wine.jpg"];
     imgView.contentMode=UIViewContentModeScaleAspectFit;
     [self.view addSubview: imgView];
     */
    if ([_contenttype isEqual:@"bi1"])
    {
        _content1.text=[SingletonClass sharedInstance].wine.bi1;
    }
    else if ([_contenttype isEqual:@"bi2"])
    {
        _content1.text=[SingletonClass sharedInstance].wine.bi2;
    }
    else if ([_contenttype isEqual:@"bi3"])
    {
        _content1.text=[SingletonClass sharedInstance].wine.bi3;
    }
    else if ([_contenttype isEqual:@"bi4"])
    {
        _content1.text=[SingletonClass sharedInstance].wine.bi4;
    }
    else if ([_contenttype isEqual:@"bi5"])
    {
        _content1.text=[SingletonClass sharedInstance].wine.bi5;
    }
    
    
    else if ([_contenttype isEqual:@"bc1"])
    {
        _content1.text=[SingletonClass sharedInstance].winery.bc1;
    }
    else if ([_contenttype isEqual:@"bc2"])
    {
        _content1.text=[SingletonClass sharedInstance].winery.bc2;
    }
    else if ([_contenttype isEqual:@"bc3"])
    {
        _content1.text=[SingletonClass sharedInstance].winery.bc3;
    }
    else if ([_contenttype isEqual:@"bc4"])
    {
        _content1.text=[SingletonClass sharedInstance].winery.bc4;
    }
    else if ([_contenttype isEqual:@"bc5"])
    {
        _content1.text=[SingletonClass sharedInstance].winery.bc5;
    }
    
    else if ([_contenttype isEqual:@"w1"])
    {
        _content1.text=expotext;
    }

    
    [_content1 setUserInteractionEnabled:TRUE];
    //_content.textColor=[UIColor whiteColor];
    //@"adsfafsd fdqsdfs  fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsd  fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq q";
    
    // [_content sizeToFit];
    // _content.text=@"adsfafsd fdqsdfs  fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsd  fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq q";
    // Do any additional setup after loading the view.
    

    isFullScreen = false;
    loding=false;
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

    
    if (self.title.length>40)
    {
        UIButton *titleLabel = [UIButton buttonWithType:UIButtonTypeCustom];
        [titleLabel setTitle:self.title forState:UIControlStateNormal];
        titleLabel.frame = CGRectMake(0, 0, 70, 44);
        titleLabel.font = [UIFont boldSystemFontOfSize:12];
        [titleLabel setTitleColor:[UIColor colorWithRed:235.0f/255.0f green:216.0f/255.0f blue:145.0f/255.0f alpha:1.0f] forState:UIControlStateNormal];
        //[titleLabel addTarget:self action:@selector(titleTap:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.titleView = titleLabel;
    } else if (self.title.length>28)
    {
        UIButton *titleLabel = [UIButton buttonWithType:UIButtonTypeCustom];
        [titleLabel setTitle:self.title forState:UIControlStateNormal];
        titleLabel.frame = CGRectMake(0, 0, 70, 44);
        titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [titleLabel setTitleColor:[UIColor colorWithRed:235.0f/255.0f green:216.0f/255.0f blue:145.0f/255.0f alpha:1.0f] forState:UIControlStateNormal];
        //[titleLabel addTarget:self action:@selector(titleTap:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.titleView = titleLabel;
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imgToFullScreen:(UITapGestureRecognizer *)pinchGestureRecognizer
{
   // NSLog(@"aafds");
    if ((!isFullScreen)&&(loding==false)) {
        [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
            //save previous frame
            prevFrame = _ima.frame;
            [_ima setFrame:[[UIScreen mainScreen] bounds]];
        }completion:^(BOOL finished){
            isFullScreen = true;
            _content1.hidden=true;
        }];
        return;
    } else {
        [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
            [_ima setFrame:prevFrame];
        }completion:^(BOOL finished){
            isFullScreen = false;
            _content1.hidden=false;
        }];
        return;
    }
}



@end
