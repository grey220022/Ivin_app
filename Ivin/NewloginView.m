//
//  NewloginView.m
//  Ivin
//
//  Created by user on 8/12/14.
//  Copyright (c) 2014 user. All rights reserved.
//


#import "SingletonClass.h"
#import "NewloginView.h"
#import "words.h"
#import "NewuserView.h"
#import "IvinHelp.h"

@interface NewloginView ()

@end

@implementation NewloginView



-(IBAction) cancelbutton
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) threadStartAnimating:(id)data {
    [_activityIndicator startAnimating];
}

-(IBAction) loginbutton
{
    
    NSString * request=[NSString stringWithFormat:@"http://www.ivintag.com/api/EndUser/Login?username=%@&password=%@", _t1.text,[IvinHelp md5HexDigest:_t2.text]];
    

    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
    NSString * response=[[NSString alloc] initWithData:[IvinHelp getpureurlcontent:request] encoding:NSUTF8StringEncoding];
    [_activityIndicator stopAnimating];
    
    if ((!response)||([response length]==0))
    {
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:[words getword:@"error"] message:[words getword:@"networkerror"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
        return;
    }
    
    if ([response isEqual:@"0"])
    {
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:[words getword:@"signin"] message:[words getword:@"loginerror"] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
    }
    else
     
    {
        //todo remember login information.
        
        
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *plistPath = [paths objectAtIndex:0];
        NSString *filename=[plistPath stringByAppendingPathComponent:@"Info.plist"];
        
        NSMutableDictionary* dic =[[NSMutableDictionary alloc] initWithContentsOfFile:filename];
        [dic setObject:response forKey: @"username"];
        [dic setObject:_t1.text forKey: @"profilename"];
        
        [dic writeToFile:filename atomically:YES];
        
        NSLog(@"%@",response);

        [SingletonClass sharedInstance].profilename=_t1.text;
        [SingletonClass sharedInstance].username=response;
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:[words getword:@"signin"] message:[words getword:@"loginok"] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
//    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction) signupbutton
{
    //NSLog(@"signupbutton press");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NewuserView *newuserview = [storyboard instantiateViewControllerWithIdentifier:@"newuserview"];
    newuserview.previousController=self;
    [self presentModalViewController:newuserview animated:YES];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    if ([SingletonClass sharedInstance].username!=nil)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [SingletonClass sharedInstance].preview=@"login";
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    _signuplabel.text=[words getword:@"signup"];
    _loginlabel.text=[words getword:@"signin"];
    
    [_signupbutton setTitle: [words getword:@"signup"] forState: UIControlStateNormal];
    
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];
   // _t1.placeholder=@"Username";
   // _t2.placeholder=@"Password";
    
    self.titlelabel.text=[words getword:@"signin"];

    _t1.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    _t1.leftViewMode = UITextFieldViewModeAlways;
    

    
    _t2.leftView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    _t2.leftViewMode = UITextFieldViewModeAlways;
    
    
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:[words getword:@"username"] attributes:@{ NSForegroundColorAttributeName : [UIColor grayColor] }];
    self.t1.attributedPlaceholder = str;

    NSAttributedString *str2 = [[NSAttributedString alloc] initWithString:[words getword:@"password"] attributes:@{ NSForegroundColorAttributeName : [UIColor grayColor] }];
    self.t2.attributedPlaceholder = str2;
    _t2.delegate=self;
    _t1.delegate=self;
    _t2.secureTextEntry=YES;
    _activityIndicator = [[UIActivityIndicatorView alloc]
                          initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    [_activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:_activityIndicator];
    _activityIndicator.center=CGPointMake(160, 250);
    _activityIndicator.hidesWhenStopped = YES;
}


//-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
