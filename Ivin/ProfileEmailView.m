//
//  ProfileEmailView.m
//  Ivin
//
//  Created by user on 3/26/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "ProfileEmailView.h"
#import "SingletonClass.h"

@interface ProfileEmailView ()

@end

@implementation ProfileEmailView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)confirm
{
    [SingletonClass sharedInstance].email=self.text.text;
    [self.navigationController popViewControllerAnimated:YES];

    
    NSString *urlString = [NSString stringWithFormat:@"http://lapinroi-001-site1.smarterasp.net/api/EndUser"];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    [request setValue:@"Fiddler" forHTTPHeaderField:@"User-Agent"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    [request setValue:@"lapinroi-001-site1.smarterasp.net" forHTTPHeaderField:@"Host"];
    [request setValue:@"350" forHTTPHeaderField:@"Content-Length"];
    
    
    NSString *bodyStr = [NSString stringWithFormat:@"{\"Id\":\"%@\",\"Email\":\"%@\",\"Address\":\"%@\",\"EndUserProfileId\":\"%@\",\"Signature\":\"%@\"}",[SingletonClass sharedInstance].username,[SingletonClass sharedInstance].email,[SingletonClass sharedInstance].city,[SingletonClass sharedInstance].usertype,[SingletonClass sharedInstance].signature];
    NSData *body = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"body data :%@", bodyStr);
    [request setHTTPBody:body];
    
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:nil];
    [conn start];

}

-(void)click1
{
    [self.text resignFirstResponder];    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.text.text=[SingletonClass sharedInstance].email;
    self.text.layer.borderWidth =1.0;
    self.text.layer.cornerRadius =5.0;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];

	// Do any additional setup after loading the view.
    UITapGestureRecognizer* gesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click1)];
    [self.view setUserInteractionEnabled:YES];
    [self.view addGestureRecognizer:gesture1];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
