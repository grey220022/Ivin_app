//
//  RadioButtonViewController.m
//  RadioButton
//
//  Created by ohkawa on 11/03/23.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import "words.h"
#import "RadioButtonViewController.h"
#import "RadioButton.h"
#import "SingletonClass.h"


@implementation RadioButtonViewController


RadioButton *rb1;
RadioButton *rb2;
RadioButton *rb3;
RadioButton *rb4;
RadioButton *rb5;
int sel;


- (void)dealloc
{
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)confirm
{
    [self.navigationController popViewControllerAnimated:YES];
    [SingletonClass sharedInstance].usertype=[NSString stringWithFormat:@"%i", sel];
    NSString *urlString = [NSString stringWithFormat:@"http://www.ivintag.com/api/EndUser"];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    [request setValue:@"Fiddler" forHTTPHeaderField:@"User-Agent"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    [request setValue:@"www.ivintag.com" forHTTPHeaderField:@"Host"];
    [request setValue:@"350" forHTTPHeaderField:@"Content-Length"];
    
    
    NSString *bodyStr = [NSString stringWithFormat:@"{\"Id\":\"%@\",\"Email\":\"%@\",\"Address\":\"%@\",\"EndUserProfileId\":\"%@\",\"Signature\":\"%@\"}",[SingletonClass sharedInstance].username,[SingletonClass sharedInstance].email,[SingletonClass sharedInstance].city,[SingletonClass sharedInstance].usertype,[SingletonClass sharedInstance].signature];
    NSData *body = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    //NSLog(@"body data :%@", bodyStr);
    [request setHTTPBody:body];
    
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:nil];
    [conn start];

}


-(void)click1
{
    [rb1.button sendActionsForControlEvents:UIControlEventTouchUpInside];
    sel=1;
}
-(void)click2
{
    [rb2.button sendActionsForControlEvents:UIControlEventTouchUpInside];
    sel=2;
}
-(void)click3
{
    [rb3.button sendActionsForControlEvents:UIControlEventTouchUpInside];
    sel=3;
}
-(void)click4
{
    [rb4.button sendActionsForControlEvents:UIControlEventTouchUpInside];
    sel=4;
}
-(void)click5
{
    [rb5.button sendActionsForControlEvents:UIControlEventTouchUpInside];
    sel=5;
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 480, 400)];
    
    self.navigationItem.title=[words getword:@"usertypeshort"];
    
    //container.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:container];
    
    UILabel *questionText = [[UILabel alloc] initWithFrame:CGRectMake(0,0,480,20)];
    questionText.backgroundColor = [UIColor clearColor];
    questionText.text = @"";
    [container addSubview:questionText];
    
    rb1 = [[RadioButton alloc] initWithGroupId:@"first group" index:0];
    rb2 = [[RadioButton alloc] initWithGroupId:@"first group" index:1];
    rb3 = [[RadioButton alloc] initWithGroupId:@"first group" index:2];
    rb4 = [[RadioButton alloc] initWithGroupId:@"first group" index:3];
    rb5 = [[RadioButton alloc] initWithGroupId:@"first group" index:4];
    
    rb1.frame = CGRectMake(10,30,22,22);
    rb2.frame = CGRectMake(10,70,22,22);
    rb3.frame = CGRectMake(10,110,22,22);
    rb4.frame = CGRectMake(10,150,22,22);
    rb5.frame = CGRectMake(10,190,22,22);
    
    
    [container addSubview:rb1];
    [container addSubview:rb2];
    [container addSubview:rb3];
    [container addSubview:rb4];
    [container addSubview:rb5];

    
    UILabel *label1 =[[UILabel alloc] initWithFrame:CGRectMake(40, 30, 260, 20)];
    label1.backgroundColor = [UIColor clearColor];
    label1.text = [words getword:@"t1"];
    label1.textColor=[UIColor whiteColor];
    [container addSubview:label1];

    UITapGestureRecognizer* gesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click1)];
    [label1 setUserInteractionEnabled:YES];
    [label1 addGestureRecognizer:gesture1];
    
    
    UILabel *label2 =[[UILabel alloc] initWithFrame:CGRectMake(40, 70, 260, 20)];
    label2.backgroundColor = [UIColor clearColor];
    label2.text = [words getword:@"t2"];
    label2.textColor=[UIColor whiteColor];
    [container addSubview:label2];

    UITapGestureRecognizer* gesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click2)];
    [label2 setUserInteractionEnabled:YES];
    [label2 addGestureRecognizer:gesture2];
    
    UILabel *label3 =[[UILabel alloc] initWithFrame:CGRectMake(40, 110, 260, 20)];
    label3.backgroundColor = [UIColor clearColor];
    label3.text = [words getword:@"t3"];
    label3.textColor=[UIColor whiteColor];
    [container addSubview:label3];

    UITapGestureRecognizer* gesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click3)];
    [label3 setUserInteractionEnabled:YES];
    [label3 addGestureRecognizer:gesture3];
    
    
    
    UILabel *label4 =[[UILabel alloc] initWithFrame:CGRectMake(40, 150, 260, 20)];
    label4.backgroundColor = [UIColor clearColor];
    label4.text = [words getword:@"t4"];
    label4.textColor=[UIColor whiteColor];
    [container addSubview:label4];
    
    UITapGestureRecognizer* gesture4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click4)];
    [label4 setUserInteractionEnabled:YES];
    [label4 addGestureRecognizer:gesture4];
    
    

    UILabel *label5 =[[UILabel alloc] initWithFrame:CGRectMake(40, 190, 260, 20)];
    label5.backgroundColor = [UIColor clearColor];
    label5.text = [words getword:@"t5"];
    label5.textColor=[UIColor whiteColor];
    [container addSubview:label5];
    
    UITapGestureRecognizer* gesture5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click5)];
    [label5 setUserInteractionEnabled:YES];
    [label5 addGestureRecognizer:gesture5];
    
    
    [RadioButton addObserverForGroupId:@"first group" observer:self];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];
    
    
    
    if ([[SingletonClass sharedInstance].usertype isEqualToString:@"1"])
    {
        [self click1];
    }
    else if ([[SingletonClass sharedInstance].usertype isEqualToString:@"2"])
    {
        [self click2];
    }
    else if ([[SingletonClass sharedInstance].usertype isEqualToString:@"3"])
    {
        [self click3];
    }
    else if ([[SingletonClass sharedInstance].usertype isEqualToString:@"4"])
    {
        [self click4];
    }
    else
    {
        [self click5];
    }
    [super viewDidLoad];
}

-(void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString *)groupId{
    //NSLog(@"changed to %lu in %@",(unsigned long)index,groupId);
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
