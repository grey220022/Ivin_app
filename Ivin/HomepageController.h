#import <UIKit/UIKit.h>

@interface HomepageController : UIViewController<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>

//@property (strong) UIActivityIndicatorView *activityIndicator;
//@property (strong) IBOutlet UITextView *t1;
//@property (strong) IBOutlet UITextView *t2;
//@property (strong) IBOutlet UITextView *t3;
@property (nonatomic,retain) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIButton *b1;
@property (weak, nonatomic) IBOutlet UIButton *b2;
@property (weak, nonatomic) IBOutlet UIButton *b3;
@property (weak, nonatomic) IBOutlet UILabel *l1;
@property (weak, nonatomic) IBOutlet UILabel *l2;
@property (weak, nonatomic) IBOutlet UILabel *l3;


@end
