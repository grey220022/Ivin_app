#import <Foundation/Foundation.h>
#import "Winery.h"
#import "Wine.h"

@interface SingletonClass : NSObject {
  NSString *username_;
  NSString *password_;
}

+ (SingletonClass*) sharedInstance;


@property(nonatomic,retain) NSString *username;
@property(nonatomic,retain) NSString *password;
@property(nonatomic,retain) NSString *lang;
@property ( nonatomic) float rating;
@property(nonatomic,retain) Wine *wine;
@property(nonatomic,retain) Wine *winery;
@property(nonatomic) int fromscan;



@end