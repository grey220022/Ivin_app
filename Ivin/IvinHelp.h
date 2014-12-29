//
//  IvinHelp.h
//  Ivin
//
//  Created by user on 7/7/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Winery.h"
#import "Wine.h"


@interface IvinHelp : NSObject//<NSURLConnectionDelegate>

+ (NSData *) getpureurlcontent:(NSString *) url;
+ (NSData *) geturlcontentfromcache:(NSString *) url;
+ (NSData *) geturlcontentintocache:(NSString *) url;
+ (void) removeurlcontent:(NSString *) url;
+ (void) wineparse:(NSData *) winecontent;
+ (void) wineidparse:(NSData *) winecontent;
+ (void) userprofileparse:(NSData *) userprofilecontent;
//+ (Winery *) wineryparse:(NSData *) winerycontent;
+ (void) wineryparse;//:(NSData *) winerycontent;
+ (NSString *) strval:(NSString *) initval replacevalue:(NSString *) replace;
+ (NSString*)md5HexDigest:(NSString*)input ;

@end

