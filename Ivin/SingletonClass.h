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
@property(nonatomic,retain) NSString *preview;
@property (nonatomic) float rating;
@property(nonatomic,retain) Wine *wine;
@property(nonatomic,retain) Winery *winery;
@property(nonatomic) int fromscan;
@property(nonatomic) int skiphistory;
@property(nonatomic,retain) UIViewController *listview;

@property(nonatomic,retain) NSString *comment;
@property(nonatomic,retain) NSString *price;
@property(nonatomic,retain) NSString *place;
@property(nonatomic,retain) NSString *like;
@property(nonatomic,retain) NSString *collect;
@property(nonatomic,retain) NSString *currency;

@property(nonatomic,retain) NSSet * wineset;

@end