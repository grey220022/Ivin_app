//
//  DetailView.m
//  Ivin
//
//  Created by user on 4/28/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "DetailView.h"
#import "SingletonClass.h"

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
    [self.navigationController popViewControllerAnimated:YES];
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
    //self.commenttext.
    
    self.commenttext.delegate=self;
    //self.commenttext.textColor=[UIColor whiteColor];
    self.rateView.editable = YES;
    self.rateView.maxRating = 5;
    self.rateView.delegate = self;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];

//    [self rateView: ratingDidChange:3];
    
    //NSString* myNewString =[NSString stringWithFormat:@"%i", self.rateView.rating];

    //self.statusLabel.text = @"Rating: 0";
   // self rateView:<#(RateView *)#> ratingDidChange:<#(float)#>
    self.statusLabel.text = [NSString stringWithFormat:@"Rating: %.01f", self.rateView.rating];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Save"  style:UIBarButtonItemStyleBordered target:self action:@selector(oov)];
    self.navigationItem.rightBarButtonItem = rightButton;
    likestate=0;
    collectstate=0;
}


-(IBAction)pricepress
{
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Price" message:@"Enter the price" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert addButtonWithTitle:@"OK"];
    [alert textFieldAtIndex:0].keyboardType=UIKeyboardTypeNumbersAndPunctuation;
    [alert show];
    alertstate=0;
}

-(IBAction)placepress
{
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Place" message:@"Enter the place" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
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

-(IBAction)collectpress
{
    UIImage *image;
    collectstate=1-collectstate;
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

-(IBAction)likepress
{
    UIImage *image;
    likestate=1-likestate;
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
