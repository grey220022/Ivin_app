//
//  DetailView.m
//  Ivin
//
//  Created by user on 4/28/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "DetailView.h"
#import "SingletonClass.h"
#import "NewloginView.h"
#import "words.h"

@interface DetailView ()

@end

int pricestate;
int placestate;
int likestate;
int collectstate;
int alertstate;



@implementation DetailView


-(void)oov
{
    NSLog(@"confirm");
    [SingletonClass sharedInstance].rating=self.rateView.rating;
    [self.navigationController popViewControllerAnimated:YES];
    
    
    NSString *urlString = [NSString stringWithFormat:@"http://www.ivintag.com/api/EndUserWine"];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"PUT"];
    
    [request setValue:@"Fiddler" forHTTPHeaderField:@"User-Agent"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    [request setValue:@"www.ivintag.com" forHTTPHeaderField:@"Host"];
    [request setValue:@"350" forHTTPHeaderField:@"Content-Length"];
    
    NSString * userid, *wineid, *pricestring,*placestring, *likestring, *collectstring;
    
    pricestring=_pricelabel.text;
    placestring=_placelabel.text;
    if (likestate==1)
        likestring=@"true";
    else
        likestring=@"false";
    
    if (collectstate==1)
        collectstring=@"true";
    else
        collectstring=@"false";
    
    
    userid=[SingletonClass sharedInstance].username;
    wineid=[SingletonClass sharedInstance].wine.Id;
    
    [SingletonClass sharedInstance].like=likestring;
    [SingletonClass sharedInstance].collect=collectstring;
    [SingletonClass sharedInstance].price=_pricelabel.text;
    [SingletonClass sharedInstance].place=_placelabel.text;
    [SingletonClass sharedInstance].comment=_commenttext.text;
    
    
    
    NSString *bodyStr = [NSString stringWithFormat:@"{\"WineId\":\"%@\",\"EndUserId\":\"%@\",\"Mark\":\"%f\",\"CurrencyId\":\"1\",\"Price\":\"%@\",\"Like\":\"%@\",\"Favorite\":\"%@\",\"Comment\":\"%@\",\"PersonalComment\":\"Comment\",\"GeoLocation\":\"%@\",\"VocalComment\":\"Comment\"}",wineid,userid,[SingletonClass sharedInstance].rating,pricestring,likestring,collectstring,_commenttext.text,placestring];
    
    //NSString *bodyStr = [NSString stringWithFormat:@"{\"WineId\":\"%@\",\"EndUserId\":\"%@\"}",wineid,userid];
    
    NSData *body = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"body data :%@", bodyStr);
    [request setHTTPBody:body];
    
    //3建立并启动连接NSRULConnection
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:nil];
    [conn start];
    

    
    
}

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
	// Do any additional setup after loading the view.
    self.rateView.notSelectedImage = [UIImage imageNamed:@"star1.png"];
    self.rateView.halfSelectedImage = [UIImage imageNamed:@"star3.png"];
    self.rateView.fullSelectedImage = [UIImage imageNamed:@"star2.png"];

    self.rateView.rating = [SingletonClass sharedInstance].rating;
    self.commenttext.delegate=self;
    self.rateView.editable = YES;
    self.rateView.maxRating = 5;
    self.rateView.delegate = self;
    _l1.text=[words getword:@"like"];
    _l2.text=[words getword:@"collect"];
    _pricelabel.text=[words getword:@"price"];
    _placelabel.text=[words getword:@"place"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];
    self.statusLabel.text = [NSString stringWithFormat:@"%@: %.01f", [words getword:@"ratings"],self.rateView.rating];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:[words getword:@"save"]  style:UIBarButtonItemStyleBordered target:self action:@selector(oov)];
    self.navigationItem.rightBarButtonItem = rightButton;
    _commenttext.text=[SingletonClass sharedInstance].comment;
    if ([[SingletonClass sharedInstance].like isEqual:@"true"])
        likestate=1;
    else
        likestate=0;
    if ([[SingletonClass sharedInstance].collect isEqual:@"true"])
        collectstate=1;
    else
        collectstate=0;
    
    [self likefresh];
    [self collectfresh];
    
//    _placelabel.text=[SingletonClass sharedInstance].place;
    
    
    NSString * temprice=[SingletonClass sharedInstance].price;
    NSString * templace=[SingletonClass sharedInstance].place;
    
    _label1.text=[words getword:@"whatdoyouthink"];
    
    if (!(temprice == nil || [temprice isKindOfClass:[NSNull class]]))
    {
        NSLog(@"going price");

        NSLog(@"price: %@",temprice);
        if  (![temprice isEqual:@"0"])
        {
 //           _pricelabel.text=@"12a3";
   //         NSLog(@"price: %@",temprice);
            
            _pricelabel.text=temprice;
        }
    }
    
    
    if (!(templace == nil || [templace isKindOfClass:[NSNull class]]))
    {
        NSLog(@"going place");
        
        NSLog(@"place: %@",templace);
        if (![templace isEqual:@""])
        {
            _placelabel.text=templace;
        }
    }
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [SingletonClass sharedInstance].preview=@"detail";
}

-(void)viewWillAppear:(BOOL)animated
{
    [SingletonClass sharedInstance].skiphistory=0;
    if ([SingletonClass sharedInstance].username==nil)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        NewloginView *newloginview = [storyboard instantiateViewControllerWithIdentifier:@"newloginview"];
        
        [self presentModalViewController:newloginview animated:YES];
        
        return;
    }
    if (_commenttext.text.length>0 )
        _label1.hidden = YES;
}

-(IBAction)pricepress
{
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:[words getword:@"price"] message:[words getword:@"entertheprice"] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert textFieldAtIndex:0].text=_pricelabel.text;
    [alert addButtonWithTitle:@"OK"];
    [alert textFieldAtIndex:0].keyboardType=UIKeyboardTypeNumbersAndPunctuation;
    [alert show];
    alertstate=0;
}

-(IBAction)placepress
{
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:[words getword:@"place"] message:[words getword:@"entertheplace"] delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert textFieldAtIndex:0].text=_placelabel.text;
    [alert addButtonWithTitle:@"OK"];
    [alert textFieldAtIndex:0].keyboardType=UIKeyboardTypeASCIICapable;
    [alert show];
    alertstate=1;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {  //OK button
        if (alertstate==0)
            _pricelabel.text=[alertView textFieldAtIndex:0].text;
        else
            _placelabel.text=[alertView textFieldAtIndex:0].text;
    }
}

-(void)likefresh
{
    UIImage *image;
    if (likestate==0)
    {
        image = [UIImage imageNamed: @"collect-vide.png"];
    }
    else
    {
        image = [UIImage imageNamed: @"collect.png"];
        
    }
    _likeimg.image=image;
}

-(void)collectfresh
{
    UIImage *image;
    if (collectstate==0)
    {
        image = [UIImage imageNamed: @"book-vide.png"];
        
    }
    else
    {
        image = [UIImage imageNamed: @"book.png"];
        
    }
    _collectimg.image=image;
}

-(IBAction)collectpress
{
    collectstate=1-collectstate;
    [self collectfresh];
}

-(IBAction)likepress
{
    likestate=1-likestate;
    [self likefresh];
}




-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)rateView:(RateView *)rateView ratingDidChange:(float)rating {
    self.statusLabel.text = [NSString stringWithFormat:@"Rating: %.01f", rating];
    
}

/*
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (![text isEqualToString:@""]) {
        _label1.hidden = YES;
    }
    
    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1) {
        _label1.hidden = NO;
    }
    
    return YES;
}
*/

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    
    
    //[_gg.navigationController popToRootViewControllerAnimated:NO];
    _label1.hidden = YES;
    NSLog(@"hahahah");
}

@end
