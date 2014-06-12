//
//  NSObject+words.h
//  Ivin
//
//  Created by user on 4/5/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface words : NSObject{
}

//+ (NSString*) sharedInstance(NSString*);
+ (NSString*) getword: (NSString*)text;// lang: (NSString*)l  ;
+ (void) initword;
+ (void) changelang:(NSString*)lang;


@end
static NSArray *keys;
static NSArray *objects;
static NSDictionary *dictionary;
static NSString *currentlang;

