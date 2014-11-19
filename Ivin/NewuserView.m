//
//  NewuserView.m
//  Ivin
//
//  Created by user on 8/12/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "NewuserView.h"
#import "IvinHelp.h"
#import "words.h"
#import "SingletonClass.h"

@interface NewuserView ()

@end

@implementation NewuserView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField: textField up: NO];
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = 80; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    _signuplabel.text=[words getword:@"signup"];//@"Sign up";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];
    
    _t1.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    _t1.leftViewMode = UITextFieldViewModeAlways;
    
    _t2.leftView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    _t2.leftViewMode = UITextFieldViewModeAlways;
    
    _t3.leftView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    _t3.leftViewMode = UITextFieldViewModeAlways;
    
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:[words getword:@"username"] attributes:@{ NSForegroundColorAttributeName : [UIColor grayColor] }];
    self.t1.attributedPlaceholder = str;
    
    NSAttributedString *str2 = [[NSAttributedString alloc] initWithString:[words getword:@"password"] attributes:@{ NSForegroundColorAttributeName : [UIColor grayColor] }];
    self.t2.attributedPlaceholder = str2;
    
    NSAttributedString *str3 = [[NSAttributedString alloc] initWithString:[words getword:@"email"] attributes:@{ NSForegroundColorAttributeName : [UIColor grayColor] }];
    self.t3.attributedPlaceholder = str3;
    
    _t1.delegate=self;
    _t2.delegate=self;
    _t3.delegate=self;

    _t2.secureTextEntry=YES;
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}


-(IBAction) cancelbutton
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction) signupbutton
{
//    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"signup button pressed");
    
    NSString * request=[NSString stringWithFormat:@"http://www.ivintag.com/api/EndUser/SignIn?username=%@&password=%@&email=%@&profileId=2",_t1.text,  [IvinHelp md5HexDigest:_t2.text], _t3.text];
    
    NSLog(@"%@",request);
    NSString * response=[[NSString alloc] initWithData:[IvinHelp geturlcontent:request] encoding:NSUTF8StringEncoding];
    NSLog(@"%@",response);
    
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
        myAlertView = [[UIAlertView alloc]initWithTitle:[words getword:@"signup"] message:[words getword:@"signuperror"] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
    }
    else
    {
        //todo remember login information.
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *plistPath = [paths objectAtIndex:0];
        //得到完整的文件名
        NSString *filename=[plistPath stringByAppendingPathComponent:@"Info.plist"];
        
        NSMutableDictionary* dic =[[NSMutableDictionary alloc] initWithContentsOfFile:filename];
        [dic setObject:response forKey: @"username"];
        [dic writeToFile:filename atomically:YES];
        
        [SingletonClass sharedInstance].username=response;
        
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:[words getword:@"signup"] message:[words getword:@"signupok"] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
        [self dismissViewControllerAnimated:NO completion:nil];
       // [self.previousController dismissViewControllerAnimated:YES completion:NULL];
     //   [self dismissViewControllerAnimated:NO completion:^(void) {
     //       [self.presentingViewController dismissViewControllerAnimated:NO completion:nil];
     //   }];
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [SingletonClass sharedInstance].preview=@"signup";
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
