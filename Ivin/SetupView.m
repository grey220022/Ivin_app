//
//  SetupView.m
//  Ivin
//
//  Created by user on 8/16/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "SetupView.h"
#import "words.h"
#import "SendViewController.h"
#import "NewloginView.h"
#import "LangView.h"
#import "ProfileView.h"
#import "SingletonClass.h"

@interface SetupView ()

@end

@implementation SetupView

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
    
    self.navigationItem.title=@"设置";
    //self.navigationController.
    [_li3 setTitle:[words getword:@"userlogin"] forState:UIControlStateNormal];
    [_li4 setTitle:[words getword:@"website"] forState:UIControlStateNormal];
    [_li5 setTitle:[words getword:@"feedback"] forState:UIControlStateNormal];
    [_li6 setTitle:[words getword:@"storerating"] forState:UIControlStateNormal];
    [_li7 setTitle:[words getword:@"about"] forState:UIControlStateNormal];
    [_li8 setTitle:[words getword:@"lang"] forState:UIControlStateNormal];
    
    
    [_li1 setTitle:  @"Huiqi" forState:UIControlStateNormal];
    //[_li1 setTitle:  [words getword:@"photo"] forState:UIControlStateNormal];
    //[_li2 setTitle:[words getword:@"profile"] forState:UIControlStateNormal];
    
    
    [_li1 setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 100, 0.0, 0.0)];
    [_li2 setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 10, 0.0, 0.0)];
    [_li3 setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 10, 0.0, 0.0)];
    [_li4 setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 10, 0.0, 0.0)];
    [_li5 setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 10, 0.0, 0.0)];
    [_li6 setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 10, 0.0, 0.0)];
    [_li7 setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 10, 0.0, 0.0)];
    [_li8 setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 10, 0.0, 0.0)];
    
    [_li1 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [_li2 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [_li3 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [_li4 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [_li5 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [_li6 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [_li7 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [_li8 setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    if ([SingletonClass sharedInstance].username == nil)
    {
        [_li3 setTitle:[words getword:@"userlogin"] forState:UIControlStateNormal];
    }
    else
    {
        [_li3 setTitle:@"注销" forState:UIControlStateNormal];
    }
}



-(IBAction)profilepress
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ProfileView *nextController = [storyboard instantiateViewControllerWithIdentifier:@"profileview"];
    nextController.title=@"帐户信息";
    [self.navigationController pushViewController:nextController animated:YES];
}

-(IBAction)loginpress
{
    if ([SingletonClass sharedInstance].username!=nil)
    {
        [SingletonClass sharedInstance].username=nil;
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:@"注销" message:@"用户已注销" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
        [_li3 setTitle:[words getword:@"userlogin"] forState:UIControlStateNormal];
        
        //todo
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *plistPath = [paths objectAtIndex:0];
        //得到完整的文件名
        NSString *filename=[plistPath stringByAppendingPathComponent:@"Info.plist"];
        
        NSMutableDictionary* dic =[[NSMutableDictionary alloc] initWithContentsOfFile:filename];
        //[dic setObject:nil forKey: @"username"];
        [dic removeObjectForKey:@"username"];

        [dic writeToFile:filename atomically:YES];
        
        return;
    }
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NewloginView *newloginview = [storyboard instantiateViewControllerWithIdentifier:@"newloginview"];
    
    [self presentModalViewController:newloginview animated:YES];
    
    
}
-(IBAction)websitepress
{
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.ivintag.com/"]];
    
    /*
    NSString *urlString = [NSString stringWithFormat:@"http://lapinroi-001-site1.smarterasp.net/api/EndUserWine"];
    NSURL *url = [NSURL URLWithString:urlString];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    [request setValue:@"Fiddler" forHTTPHeaderField:@"User-Agent"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    [request setValue:@"lapinroi-001-site1.smarterasp.net" forHTTPHeaderField:@"Host"];
    [request setValue:@"220" forHTTPHeaderField:@"Content-Length"];
    
    
    NSString *bodyStr = [NSString stringWithFormat:@"{\"WineId\":\"2\",\"EndUserId\":\"14\",\"Mark\":\"90\",\"CurrencyId\":\"1\",\"Price\":\"20\",\"Like\":\"true\",\"Favorite\":\"true\",\"Comment\":\"Comment\",\"PersonalComment\":\"Comment\",\"GeoLocation\":\"Comment\",\"VocalComment\":\"Comment\"}"];
//NSString *bodyStr =//@"abc";
  //  NSString *bodyStr = [NSString stringWithFormat:@"ggg"];
                     
                     
    NSData *body = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"body data :%@", bodyStr);
    [request setHTTPBody:body];
    
    //3建立并启动连接NSRULConnection
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:nil];
    [conn start];
    */
    
    
    /*
    NSURLResponse *response = nil;
    NSError *error = nil;
    //第二，三个参数是指针的指针，所有要用取址符，这个方法是同步方法。同步操作没有完成，后面的代码不会执行。
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    //同步访问的数据的后续处理
    */
    
}


- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [SingletonClass sharedInstance].preview=@"setup";
}


-(IBAction)feedbackpress
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SendViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"sendview"];
    [self presentModalViewController:vc animated:NO];
}

-(IBAction)appratingpress
{
    
    #define YOUR_APP_STORE_ID 916556089 //Change this one to your ID
    static NSString *const iOS7AppStoreURLFormat = @"itms-apps://itunes.apple.com/app/id%d";
    static NSString *const iOSAppStoreURLFormat = @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%d";
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:([[UIDevice currentDevice].systemVersion floatValue] >= 7.0f)? iOS7AppStoreURLFormat: iOSAppStoreURLFormat, YOUR_APP_STORE_ID]]]; // Would contain the right link
    //NSString *evaluateString = [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=341232718"];
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:evaluateString]];
    /*
    
    NSString *urlString = [NSString stringWithFormat:@"www.baidu.com"];
    NSURL *url = [NSURL URLWithString:urlString];
    
    //2建立请求NSMutableURLRequest（post需要用这个）
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //1)post请求方式,网络请求默认是get方法，所以如果我们用post请求，必须声明请求方式。
    [request setHTTPMethod:@"POST"];
    //2)post请求的数据体,post请求中数据体时，如果有中文，不需要转换。因为ataUsingEncoding方法已经实现了转码。
    NSString *bodyStr = @"{"WineId":"1",
    "EndUserId":"1",
    "Mark":"90",
    "CurrencyId":"1",
    "Price":"20",
    "Like":"true",
    "Favorite":"true",
    "Comment":"Comment",
    "PersonalComment":"Comment",
    "GeoLocation":"Comment",
    "VocalComment":"Comment"
}"//
    [NSString stringWithFormat:@"username=%@&password=%@", userName, pwd];
    //将nstring转换成nsdata
    NSData *body = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"body data %@", body);
    [request setHTTPBody:body];
    
    //3建立并启动连接NSRULConnection
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
    [conn start];
*/
    
    
}

-(IBAction)aboutpress
{
    UIAlertView *myAlertView;
    myAlertView = [[UIAlertView alloc]initWithTitle:@"制作团队" message:@"巴黎酒社团队制作" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [myAlertView show];
}

-(IBAction)languagepress
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LangView *nextController = [storyboard instantiateViewControllerWithIdentifier:@"langview"];
    nextController.title=[words getword:@"lang"];
    [self.navigationController pushViewController:nextController animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
