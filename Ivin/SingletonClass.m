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
@synthesize profilename = profilename_ ;


static SingletonClass *sharedInstance = nil;

// Get the shared instance and create it if necessary.
+ (SingletonClass *)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    
    return sharedInstance;
}

-(void)resetdate
{
    self.WineName=[[NSMutableArray alloc] initWithObjects: nil];
    self.WineImageUrl=[[NSMutableArray alloc] initWithObjects: nil];
    self.WineryName=[[NSMutableArray alloc] initWithObjects: nil];
    self.WineryCountry=[[NSMutableArray alloc] initWithObjects: nil];
    self.Appellation=[[NSMutableArray alloc] initWithObjects: nil];
    self.Year=[[NSMutableArray alloc] initWithObjects: nil];
    self.AverageMark=[[NSMutableArray alloc] initWithObjects: nil];
    self.CreateDate=[[NSMutableArray alloc] initWithObjects: nil];
    self.WineCode=[[NSMutableArray alloc] initWithObjects: nil];
    self.WineId=[[NSMutableArray alloc] initWithObjects: nil];
    self.Likewine=[[NSMutableArray alloc] initWithObjects: nil];
    self.Favorite=[[NSMutableArray alloc] initWithObjects: nil];
    self.RegionName=[[NSMutableArray alloc] initWithObjects: nil];
    self.WineTypeName=[[NSMutableArray alloc] initWithObjects: nil];
    self.WineryImageUrl=[[NSMutableArray alloc] initWithObjects: nil];
    
}

// We can still have a regular init method, that will get called the first time the Singleton is used.
- (id)init
{
    self.fromscan=0;
    self.skiphistory=0;
    self.wineset= [NSSet setWithObjects:nil];
    self = [super init];
    self.searchmode=false;
    self.filterlevel=1;
    self.firstswitch=true;
    
    [self resetdate];
    
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


