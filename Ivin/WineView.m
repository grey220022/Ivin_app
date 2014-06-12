//
//  WineView.m
//  Ivin
//
//  Created by user on 3/9/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "WineView.h"

@interface WineView ()

@end

@implementation WineView

@synthesize toplabel;
@synthesize mainlabel;



- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.mainlabel.layer.borderWidth =1.0;
    //self.mainlabel.layer.cornerRadius =5.0;
    self.mainlabel.text=_maintext;
	// Do any additional setup after loading the view.
    NSLog(@"original text");
    mainlabel.numberOfLines = 0;
    //[mainlabel sizeToFit];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)changeText
{
    NSLog(@"I am changing");
    self.mainlabel.text=@"葡萄";
}

@end
