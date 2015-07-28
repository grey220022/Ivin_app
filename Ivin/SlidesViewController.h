//
//  ViewController.h
//  PageViewDemo
//
//  Created by Simon on 24/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface SlidesViewController : UIViewController <UIPageViewControllerDataSource>

- (IBAction)startWalkthrough:(id)sender;
- (IBAction)signinWalkthrough:(id)sender;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;
//@property (strong, nonatomic) UIButton *startbutton;
//@property (strong, nonatomic) UIButton *signinbutton;
@property (weak, nonatomic) IBOutlet UIButton *startbutton;
@property (weak, nonatomic) IBOutlet UIButton *signinbutton;
@end
