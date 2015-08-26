//
//  AppDelegate.m
//  Ivin
//
//  Created by user on 2/27/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "AppDelegate.h"
#import "words.h"
#import "SingletonClass.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [words initword];
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstStart"]){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstStart"];
      //  NSLog(@"第一次启动");
        NSString *path = [[NSBundle mainBundle]pathForResource:@"Info" ofType:@"plist"];
        NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:path];
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *plistPath = [paths objectAtIndex:0];
        NSString *filename=[plistPath stringByAppendingPathComponent:@"Info.plist"];
        [dic writeToFile:filename atomically:YES];
        needslides=YES;
    }else{
       // NSLog(@"不是第一次启动");
        needslides=YES;
    }
    
    
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);


    
    NSString *plistPath = [paths objectAtIndex:0];
    NSString *filename=[plistPath stringByAppendingPathComponent:@"Info.plist"];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithContentsOfFile:filename];
    //[dic writeToFile:filename atomically:YES];
    
    if (dic[@"username"]==nil)
    {
        [SingletonClass sharedInstance].username=nil;
    }
    else
    {
        [SingletonClass sharedInstance].username=dic[@"username"];
        [SingletonClass sharedInstance].profilename=dic[@"profilename"];        
    }
    
    
   // NSLog(@"%d",[dic count] );
    
   // NSLog(@"%@",dic[@"lang"] );
    if (dic[@"lang"]==nil)
    //if (1==1)
    {
      int st;
      
      
//      [dic setObject:@"fr" forKey: @"lang"];
        
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        NSString* deflang=[[[defaults objectForKey:@"AppleLanguages"] objectAtIndex:0] substringWithRange:NSMakeRange(0,2)];
        [dic setObject:deflang forKey: @"lang"];

     // NSLog(@"Success = %@", dic[@"lang"]);
    
      st=[dic writeToFile:filename atomically:YES];
     // NSLog(@"Success = %d", st);
        
        
    }
    
    
    
    
    NSString* curlang=[dic objectForKey:@"lang"];
    
    if ((![curlang isEqual:@"fr"])&&(![curlang isEqual:@"zh"])&&(![curlang isEqual:@"en"]))
    {
        curlang=@"en";
    }
    
    [SingletonClass sharedInstance].lang=curlang;
    [words changelang: curlang];
   // NSLog(@"cl = %@", curlang);
    
    
    /*
    
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"Data" ofType:@"plist"];
    
    
    //NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    //NSString *plistPath = [paths objectAtIndex:0];
    //plistPath=[plistPath stringByAppendingPathComponent:@"Info.plist"];
    
    //NSLog(@"%@",plistPath);
    //NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    //NSString *plistPath =[rootPath stringByAppendingPathComponent:@"Data.plist"];
    //[[NSBundle mainBundle] pathForResource:@"try" ofType:@"plist"];
    NSMutableDictionary* dic =[[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    //NSMutableDictionary * dict = [dic mutableCopy];

    
    
    UIAlertView *myAlertView;
   // NSLog(@"%d",[dic count]);
    myAlertView = [[UIAlertView alloc]initWithTitle:@"制作团队" message:[NSString stringWithFormat:@"%d", [dic count]] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [myAlertView show];
    
    
    */
    /*
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath = [paths objectAtIndex:0];
    //得到完整的文件名
    NSString *filename=[plistPath stringByAppendingPathComponent:@"Info.plist"];

    NSMutableDictionary* dic =[[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    if ([dic objectForKey:@"lang"]==nil)
    {
        

        
        
        
        NSLog(@"oov");
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        NSString* deflang=[[[defaults objectForKey:@"AppleLanguages"] objectAtIndex:0] substringWithRange:NSMakeRange(0,2)];
        [dic setObject:deflang forKey: @"lang"];
        
        NSLog(@"%d",[dic count]);
        NSLog(@"filename:%@",filename);
        int success=[dic writeToFile:filename atomically:YES];
        
        //NSError * error = nil;
        
        NSLog(@"Success = %d", success);
    }
    NSString* curlang=[dic objectForKey:@"lang"];
    [SingletonClass sharedInstance].lang=curlang;
    [words changelang: curlang];
    */
    //NSLog(@"%@",curlang);
//    NSArray* array = [dic allKeys];
//    for (id item in array) {
 //       NSLog(@"%@",item);
 //   }
    
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:235.0f/255.0f green:216.0f/255.0f blue:145.0f/255.0f alpha:1.0]];
    [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    
    
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:235.0f/255.0f green:216.0f/255.0f blue:145.0f/255.0f alpha:1.0],
                                                           UITextAttributeTextColor,
                                                           [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8],UITextAttributeTextShadowColor,
                                                           [NSValue valueWithUIOffset:UIOffsetMake(0, 1)],
                                                           UITextAttributeTextShadowOffset,
                                                           [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], UITextAttributeFont, nil]];

    // [[UIBarButtonItem appearance] setB
//    [[UIBarButtonItem appearance] setBackB
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -400.f)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
