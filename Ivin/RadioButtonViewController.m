//
//  RadioButtonViewController.m
//  RadioButton
//
//  Created by ohkawa on 11/03/23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RadioButtonViewController.h"
#import "RadioButton.h"


@implementation RadioButtonViewController

- (void)dealloc
{
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 480, 400)];

    //container.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:container];
    
    UILabel *questionText = [[UILabel alloc] initWithFrame:CGRectMake(0,0,480,20)];
    questionText.backgroundColor = [UIColor clearColor];
    questionText.text = @"";
    [container addSubview:questionText];
    
    RadioButton *rb1 = [[RadioButton alloc] initWithGroupId:@"first group" index:0];
    RadioButton *rb2 = [[RadioButton alloc] initWithGroupId:@"first group" index:1];
    RadioButton *rb3 = [[RadioButton alloc] initWithGroupId:@"first group" index:2];
    RadioButton *rb4 = [[RadioButton alloc] initWithGroupId:@"first group" index:3];
    RadioButton *rb5 = [[RadioButton alloc] initWithGroupId:@"first group" index:4];
    
    rb1.frame = CGRectMake(10,30,22,22);
    rb2.frame = CGRectMake(10,60,22,22);
    rb3.frame = CGRectMake(10,90,22,22);
    rb4.frame = CGRectMake(10,120,22,22);
    rb5.frame = CGRectMake(10,150,22,22);
    
    
    [container addSubview:rb1];
    [container addSubview:rb2];
    [container addSubview:rb3];
    [container addSubview:rb4];
    [container addSubview:rb5];

    
    UILabel *label1 =[[UILabel alloc] initWithFrame:CGRectMake(40, 30, 260, 20)];
    label1.backgroundColor = [UIColor clearColor];
    label1.text = @"葡萄酒酒农";
    [container addSubview:label1];

    UILabel *label2 =[[UILabel alloc] initWithFrame:CGRectMake(40, 60, 260, 20)];
    label2.backgroundColor = [UIColor clearColor];
    label2.text = @"葡萄酒从业者";
    [container addSubview:label2];    

    UILabel *label3 =[[UILabel alloc] initWithFrame:CGRectMake(40, 90, 260, 20)];
    label3.backgroundColor = [UIColor clearColor];
    label3.text = @"葡萄酒记者";
    [container addSubview:label3];

    UILabel *label4 =[[UILabel alloc] initWithFrame:CGRectMake(40, 120, 260, 20)];
    label4.backgroundColor = [UIColor clearColor];
    label4.text = @"葡萄酒爱好者";
    [container addSubview:label4];

    UILabel *label5 =[[UILabel alloc] initWithFrame:CGRectMake(40, 150, 260, 20)];
    label5.backgroundColor = [UIColor clearColor];
    label5.text = @"葡萄酒消费者";
    [container addSubview:label5];
    
    [RadioButton addObserverForGroupId:@"first group" observer:self];

    [super viewDidLoad];
}

-(void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString *)groupId{
    NSLog(@"changed to %lu in %@",(unsigned long)index,groupId);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
