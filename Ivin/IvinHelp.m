//
//  IvinHelp.m
//  Ivin
//
//  Created by user on 7/7/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "IvinHelp.h"
#import "SingletonClass.h"

@implementation IvinHelp



+ (NSData *) geturlcontent:(NSString *) url
{
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest
                                          returningResponse:&response
                                                      error:&error];
    /*
    if (error == nil)
    {
        return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    }
     */
//    return @"Error";
    if (error == nil)
      {
        return data;
      }
    return nil;
}

+ (Wine *) wineparse:(NSData *) winecontent
{
    Wine * temp;
    
    return temp;
}


+ (void) wineryparse:(NSData *) winerycontent
//+ (Winery *) wineryparse:(NSData *) winerycontent
{
    //NSString * ggg=[[NSString alloc] initWithData:winerycontent encoding:NSASCIIStringEncoding];
    //NSLog(@"%@",ggg);
    
    Winery * temp=[[Winery alloc] init];
    NSError *error;
    NSDictionary *tempdic = [NSJSONSerialization JSONObjectWithData:winerycontent options:NSJSONReadingMutableLeaves error:&error];
    
    //NSArray * keys=[tempdic allKeys];
    
    
//    temp.Name= [tempdic objectForKey:@"Name"];
    
    // NSLog(@"hahaha");
    //NSString * gggg=[tempdic objectForKey:@"Name"];

    //NSLog(@"%@",gggg);
    //temp.Name=gggg;
    //NSLog(@"%@",temp.Name);
    
//    temp.Name= [tempdic objectForKey:@"Name"];
//    temp.Description=[tempdic objectForKey:@"Description"];
//    temp.Winetours=[tempdic objectForKey:@"Winetours"];
    
//    temp.Name=;
//    [=temp;
     
//    [SingletonClass sharedInstance].winery=temp;
    [SingletonClass sharedInstance].winery.Name=[tempdic objectForKey:@"Name"];
    NSLog(@"%@",[SingletonClass sharedInstance].winery.Name);
    
    //return temp;
}




@end
