//
//  ViewController.m
//  PageViewDemo
//
//  Created by Simon on 24/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "SlidesViewController.h"
#import "SingletonClass.h"
#import "NewloginView.h"
#import "words.h"


@interface SlidesViewController ()

@end

@implementation SlidesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];

	// Create the data model
    _pageTitles = @[[words getword:@"slide1"] , [words getword:@"slide2"], [words getword:@"slide3"]];
    _pageImages = @[@"S2.png", @"S3.png", @"S1.png"];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    [_startbutton setTitle:[words getword:@"skip"]  forState:UIControlStateNormal];
    [_signinbutton setTitle:[words getword:@"signin"]  forState:UIControlStateNormal];
    if([UIScreen mainScreen].bounds.size.height < 568)
    {
        _startbutton.frame = CGRectOffset( _startbutton.frame, 0, -85 );
        _signinbutton.frame = CGRectOffset( _signinbutton.frame, 0, -85 );
        
      //[self ios6move:_startbutton];
      //[self ios6move:_signinbutton];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.view.backgroundColor=[UIColor blackColor];
    //self.hidesBottomBarWhenPushed = YES;
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    if ([SingletonClass sharedInstance].username!=nil)
    {
        [self.navigationController popViewControllerAnimated:NO];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startWalkthrough:(id)sender {
//    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
//    NSArray *viewControllers = @[startingViewController];
//    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)signinWalkthrough:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NewloginView *newloginview = [storyboard instantiateViewControllerWithIdentifier:@"newloginview"];
    
    [self presentModalViewController:newloginview animated:YES];

}


- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }

    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

-(void)ios6move: (UIView *)u
{
    CGPoint point =CGPointMake(0, u.frame.origin.y-65);
    CGRect frame = u.frame;
    frame.origin=point;
    u.frame=frame;
}


@end
