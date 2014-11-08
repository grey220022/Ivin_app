//
//  SignView.m
//  Ivin
//
//  Created by user on 3/25/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "SignView.h"
#import "SingletonClass.h"
#import "words.h"

@interface SignView ()

@end

@implementation SignView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)click1
{
    [self.text resignFirstResponder];
}

- (void)confirm
{
    [self.navigationController popViewControllerAnimated:YES];
    [SingletonClass sharedInstance].signature=self.text.text;
    
    
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


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.text.text=[SingletonClass sharedInstance].signature;
    self.text.layer.borderWidth =1.0;
    self.text.layer.cornerRadius =5.0;
    [self.text setContentInset:UIEdgeInsetsMake(-45, 0, 5,0)];
    self.navigationItem.title=[words getword:@"signature"];//@"个性签名";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];
    
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
