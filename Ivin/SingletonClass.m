//
//  NSObject+SingletonClass.m
//  Ivin
//
//  Created by user on 4/5/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "SingletonClass.h"

@interface SingletonClass ()

@end


@implementation SingletonClass : NSObject 

@synthesize username = username_ ;
@synthesize password = password_ ;


static SingletonClass *sharedInstance = nil;

// Get the shared instance and create it if necessary.
+ (SingletonClass *)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    
    return sharedInstance;
}



// We can still have a regular init method, that will get called the first time the Singleton is used.
- (id)init
{
    self.fromscan=0;
    self.skiphistory=0;
    self.wineset= [NSSet setWithObjects:nil];
    self = [super init];
    
    _wine=[[Wine alloc]init];
    _winery=[[Winery alloc]init];
    
    if (self) {
        // Work your initialising magic here as you normally would
        
    }
    return self;
}

/*
- (NSString *)getusername
{
    return username;
}

- (NSString *)getpassword
{
    return password;
}

*/



@end


