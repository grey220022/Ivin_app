#import <Foundation/Foundation.h>
#import "Winery.h"
#import "Wine.h"

@interface SingletonClass : NSObject {
  NSString *username_;
  NSString *password_;
}

+ (SingletonClass*) sharedInstance;
-(void)resetdate;

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

@property(nonatomic,retain) NSString *city;
@property(nonatomic,retain) NSString *email;
@property(nonatomic,retain) NSString *usertype;
@property(nonatomic,retain) NSString *signature;


@property(nonatomic,retain) NSString *filterregion;
@property(nonatomic,retain) NSString *filtertype;
//@property(nonatomic,retain) NSString *filterappellation;
@property(nonatomic,retain) NSString *filterwineryname;

@property(nonatomic) bool firstswitch;
@property(nonatomic) bool searchmode;


@property(nonatomic) int filterlevel;
@property(nonatomic,retain) NSMutableArray *WineName;
@property(nonatomic,retain) NSMutableArray *WineImageUrl;
@property(nonatomic,retain) NSMutableArray *WineryName;
@property(nonatomic,retain) NSMutableArray *WineryCountry;
@property(nonatomic,retain) NSMutableArray *Appellation;
@property(nonatomic,retain) NSMutableArray *Year;
@property(nonatomic,retain) NSMutableArray *AverageMark;
@property(nonatomic,retain) NSMutableArray *CreateDate;
@property(nonatomic,retain) NSMutableArray *WineCode;
@property(nonatomic,retain) NSMutableArray *WineId;
@property(nonatomic,retain) NSMutableArray *Likewine;
@property(nonatomic,retain) NSMutableArray *Favorite;
@property(nonatomic,retain) NSMutableArray *RegionName;
@property(nonatomic,retain) NSMutableArray *WineTypeName;
@property(nonatomic,retain) NSMutableArray *WineryImageUrl;

@end




