#import <Foundation/Foundation.h>

@interface SingletonClass : NSObject {
  NSString *username_;
  NSString *password_;
}

+ (SingletonClass*) sharedInstance;


@property(nonatomic,retain) NSString *username;
@property(nonatomic,retain) NSString *password;
@property(nonatomic,retain) NSString *lang;
@property ( nonatomic) float rating;



@end