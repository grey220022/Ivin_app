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

+ (void) wineparse:(NSData *) winecontent
{
    Wine * temp;
    
    NSError *error;
    NSDictionary *tempdic = [NSJSONSerialization JSONObjectWithData:winecontent options:NSJSONReadingMutableLeaves error:&error];

    [SingletonClass sharedInstance].wine.WineName=[tempdic objectForKey:@"WineName"];
    [SingletonClass sharedInstance].wine.Vintage=[tempdic objectForKey:@"Vintage"];
    [SingletonClass sharedInstance].wine.WineTypeName=[tempdic objectForKey:@"WineTypeName"];
    [SingletonClass sharedInstance].wine.WineryRecommandation=[tempdic objectForKey:@"WineryRecommandation"];
    [SingletonClass sharedInstance].wine.FoodParing=[tempdic objectForKey:@"FoodParing"];
    
    /*
    [SingletonClass sharedInstance].wine.Winetours=[tempdic objectForKey:@"Winetours"];
    
    [SingletonClass sharedInstance].wine.Mail=[tempdic objectForKey:@"Mail"];
    [SingletonClass sharedInstance].wine.Facebook=[tempdic objectForKey:@"Facebook"];*/
/*
    NSMutableString* someString = [NSMutableString stringWithString: [SingletonClass sharedInstance].winery.Mail];
    [someString appendString: [SingletonClass sharedInstance].winery.Facebook];
    
    [SingletonClass sharedInstance].winery.Contact=someString;
  */
    
    
    
   // return temp;
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
    [SingletonClass sharedInstance].winery.Description=[tempdic objectForKey:@"Description"];
    [SingletonClass sharedInstance].winery.VinePresentation=[tempdic objectForKey:@"VinePresentation"];
    [SingletonClass sharedInstance].winery.OtherHistory=[tempdic objectForKey:@"OtherHistory"];
    [SingletonClass sharedInstance].winery.OtherHistoryTitle=[tempdic objectForKey:@"OtherHistoryTitle"]; //Les hommes
    [SingletonClass sharedInstance].winery.Winetours=[tempdic objectForKey:@"Winetours"]; //Les hommes
    
    [SingletonClass sharedInstance].winery.Mail=[tempdic objectForKey:@"Mail"]; //Les hommes
    [SingletonClass sharedInstance].winery.Facebook=[tempdic objectForKey:@"Facebook"]; //Les hommes

    NSMutableString* someString = [NSMutableString stringWithString: [SingletonClass sharedInstance].winery.Mail];
    [someString appendString: [SingletonClass sharedInstance].winery.Facebook];
    
    [SingletonClass sharedInstance].winery.Contact=someString;

    
    //NSLog(@"%@",[SingletonClass sharedInstance].winery.Name);

    
    
    //return temp;
}




@end
