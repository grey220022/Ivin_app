//
//  AcceptWineViewController.m
//  Ivin
//
//  Created by user on 3/1/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "UIImage+Network.h"
#import "AcceptWineViewController.h"
#import "FormTableController.h"
#import "RegisterFormTableController.h"
#import "WineView.h"
#import "CommentView.h"
#import "ProfileView.h"
#import "DetailView.h"
#import "words.h"
#import "SingletonClass.h"
#import "words.h"
#import "VinViewController.h"
#import "WineryViewController.h"
#import "GrapeViewController.h"
#import "IvinHelp.h"
#import "QRViewController.h"

@interface AcceptWineViewController ()

@property(nonatomic,retain) NSArray * listData;
@property(nonatomic,retain) NSArray * grapeData;

@property(nonatomic,retain) NSArray * sublistData;

@end

BOOL isFullScreen;
CGRect prevFrame;
CGRect qrFrame;


@implementation AcceptWineViewController
@synthesize rateView;
@synthesize statusLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    if (([SingletonClass sharedInstance].username!=nil))
    {
        NSString *url=[NSString stringWithFormat:@"http://www.ivintag.com/api/EndUserWine/GetInfo?enduserid=%@&wineid=%@",[SingletonClass sharedInstance].username,[SingletonClass sharedInstance].wine.Id];
        NSData* userwine=[IvinHelp geturlcontentfromcache:url];
        NSLog(@"first");
        
        if ((!userwine)||([userwine length]==0))
        {
            [SingletonClass sharedInstance].rating=0;
        }
        else {
            NSString* newStr = [[NSString alloc] initWithData:userwine encoding:NSUTF8StringEncoding];
            [IvinHelp wineidparse:userwine];
        }
    }

    
    
    switch ([SingletonClass sharedInstance].wine.WineTypeId) {
        case 1:
            _cup.image=[UIImage imageNamed:@"cup.png"];
            break;
        case 2:
            _cup.image=[UIImage imageNamed:@"Redwine.png"];
            break;
        case 3:
            _cup.image=[UIImage imageNamed:@"rose.png"];
            break;
        case 4:
            _cup.image=[UIImage imageNamed:@"Champagne.png"];
            break;
        case 5:
            _cup.image=[UIImage imageNamed:@"champagne rose.png"];
            break;
            
        default:
            _cup.image=[UIImage imageNamed:@"white.png"];
            break;
    }
    self.navigationItem.title= [SingletonClass sharedInstance].winery.Name;  //[_winery Name];
    [_sw setScrollEnabled:YES];
    [_sw setContentSize:CGSizeMake(320, 920)];
    
    
    if([UIScreen mainScreen].bounds.size.height < 568){
        
        CGPoint point =CGPointMake(0, -23.0);
        CGRect frame = _sw.frame;
        frame.origin = point;
        _sw.frame=frame;
    }
    
    
    //_sw.delegate=self;
    self.rateView.notSelectedImage = [UIImage imageNamed:@"star1.png"];
    self.rateView.halfSelectedImage = [UIImage imageNamed:@"star3.png"];
    self.rateView.fullSelectedImage = [UIImage imageNamed:@"star2.png"];
    self.rateView.rating = [SingletonClass sharedInstance].rating;
    self.rateView.editable = YES;
    self.rateView.maxRating = 5;
    self.rateView.delegate = self;
    self.statusLabel.text=@"Rating: 0";
    //self.description.numberOfLines = 0;
    [self.description1 sizeToFit];
    self.description1.lineBreakMode=UILineBreakModeWordWrap;
    
    
    NSString *filePath;
    
    int ratingvalue;
    
    NSLog(@"second");
    
    ratingvalue=(int)([[SingletonClass sharedInstance].wine.AverageMark floatValue]+0.5);
    
    switch (ratingvalue) {
        case 1:
            filePath=[[NSBundle mainBundle] pathForResource:@"10" ofType:@"png"];
            break;
        case 2:
            filePath=[[NSBundle mainBundle] pathForResource:@"20" ofType:@"png"];
            break;
        case 3:
            filePath=[[NSBundle mainBundle] pathForResource:@"30" ofType:@"png"];
            break;
        case 4:
            filePath=[[NSBundle mainBundle] pathForResource:@"40" ofType:@"png"];
            break;
        case 5:
            filePath=[[NSBundle mainBundle] pathForResource:@"50" ofType:@"png"];
            break;
        case 0:
            filePath=[[NSBundle mainBundle] pathForResource:@"00" ofType:@"png"];
            break;
            
        default:
            filePath=[[NSBundle mainBundle] pathForResource:@"00" ofType:@"png"];
            break;
    }
    UIImage *startimages=[UIImage imageWithContentsOfFile:filePath];
    self.starts.image=startimages;

    
    
    self.pair.numberOfLines = 0;
    [self.pair sizeToFit];
    
    _nameandyear.lineBreakMode = UILineBreakModeWordWrap;
    _nameandyear.numberOfLines = 0;
    [_nameandyear sizeToFit];
    
    [_iw loadImageFromURL:[NSURL URLWithString:[SingletonClass sharedInstance].wine.WinePhotoUrl] placeholderImage:nil cachingKey:[SingletonClass sharedInstance].wine.WinePhotoUrl];
    _iw.contentMode=UIViewContentModeScaleAspectFit;
    
    NSArray *array=[[NSArray alloc] initWithObjects:@"酒的故事",@"葡萄种类",@"评论",nil];
    self.listData=array;
    array=[[NSArray alloc] initWithObjects:@"第一种葡萄",@"第二种葡萄",@"第三种葡萄",nil];
    self.grapeData=array;

    _sw.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];
    
    _la1.text=[words getword:@"grape"];
    _la2.text=[words getword:@"wine"];
    _la3.text=[words getword:@"winery"];
    _qrcode.text=[words getword:@"qrcode"];
    _la4.text=[words getword:@"recommandationofwinemaker"];
    _la5.text=[words getword:@"averagerating"];
    _la6.text=[words getword:@"upvotes"];
    
    
    
    _n1.text=[SingletonClass sharedInstance].wine.AverageMark;
    _n2.text=[SingletonClass sharedInstance].wine.TotalMarkUser;
    _n3.text=[SingletonClass sharedInstance].wine.TotalLike;
    
    
    
    _li4.text=[SingletonClass sharedInstance].wine.AppellationName;
    _description1.text=[SingletonClass sharedInstance].wine.WineryRecommandation;
    _li8.text=[SingletonClass sharedInstance].wine.FoodParing;
    
    _li9.text=[SingletonClass sharedInstance].wine.ClassementName;
    
    
    
    NSMutableString* someString = [NSMutableString stringWithString: [SingletonClass sharedInstance].wine.WineName];
    [someString appendString: @" "];
    [someString appendString: [SingletonClass sharedInstance].wine.Vintage];
    
    _nameandyear.text=someString;
    
    someString = [NSMutableString stringWithString: [SingletonClass sharedInstance].wine.AppellationName];
    [someString appendString: @", "];
    [someString appendString: [SingletonClass sharedInstance].winery.RegionName];
    [someString appendString: @", "];
    [someString appendString: [SingletonClass sharedInstance].winery.ContactCountryName];
    _li3.text=someString;
    _li2.text=[SingletonClass sharedInstance].wine.WineTypeName;
    _li3.lineBreakMode = UILineBreakModeWordWrap;
    _li3.numberOfLines = 0;
    [_li3 sizeToFit];
    
    if ([SingletonClass sharedInstance].winery.Name.length>28)
    {
      UIButton *titleLabel = [UIButton buttonWithType:UIButtonTypeCustom];
      [titleLabel setTitle:[SingletonClass sharedInstance].winery.Name forState:UIControlStateNormal];
      titleLabel.frame = CGRectMake(0, 0, 70, 44);
      titleLabel.font = [UIFont boldSystemFontOfSize:16];
      [titleLabel setTitleColor:[UIColor colorWithRed:235.0f/255.0f green:216.0f/255.0f blue:145.0f/255.0f alpha:1.0f] forState:UIControlStateNormal];
      self.navigationItem.titleView = titleLabel;
    }
    
    if ([SingletonClass sharedInstance].username!=nil)
    {
        NSString *urlString = [NSString stringWithFormat:@"http://www.ivintag.com/api/EndUserWine"];
        NSURL *url = [NSURL URLWithString:urlString];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"Fiddler" forHTTPHeaderField:@"User-Agent"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
        [request setValue:@"www.ivintag.com" forHTTPHeaderField:@"Host"];
        [request setValue:@"220" forHTTPHeaderField:@"Content-Length"];
        NSString * userid, *wineid;
        userid=[SingletonClass sharedInstance].username;
        wineid=[SingletonClass sharedInstance].wine.Id;
        NSString *bodyStr = [NSString stringWithFormat:@"{\"WineId\":\"%@\",\"EndUserId\":\"%@\"}",wineid,userid];
        NSData *body = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:body];
        NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:nil];
        [conn start];
        
        
    }
    
    isFullScreen = false;
    [_sw bringSubviewToFront:_iw];
    _iw.userInteractionEnabled = YES;
    UITapGestureRecognizer *pgr = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(imgToFullScreen:)];
    pgr.delegate = self;
    [_iw addGestureRecognizer:pgr];
    
    NSLog(@"third");

}


-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"fourth");
    self.wine=[SingletonClass sharedInstance].wine;
    self.winery=[SingletonClass sharedInstance].winery;
    if ([[SingletonClass sharedInstance].preview isEqual:@"detail"])
    {
        self.rateView.rating = [SingletonClass sharedInstance].rating;
        [self.rateView setRating:self.rateView.rating];
    }
    NSLog(@"fifth");
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"sixth");
    [super viewDidAppear:animated];
}


- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [SingletonClass sharedInstance].preview=@"accept";
}


-(IBAction)showqrcode
{
    if (isFullScreen)
        return;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    QRViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"qrview"];
    
    nextController.title=[words getword:@"qrcode"];
    [self.navigationController pushViewController:nextController animated:YES];
}


-(IBAction)showgrapes
{
    if (isFullScreen)
        return;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    GrapeViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"grapeview"];
    
    nextController.title=[words getword:@"grape"];
    
    nextController.grapearray=[SingletonClass sharedInstance].wine.grapearray;
    
    [self.navigationController pushViewController:nextController animated:YES];
    
}


-(IBAction) showwinery
{
    if (isFullScreen)
        return;

    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    WineryViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"wineryview"];
    
    nextController.title=[words getword:@"winery"];
    [self.navigationController pushViewController:nextController animated:YES];
    
    
}



-(IBAction) showwine
{
    if (isFullScreen)
        return;

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    VinViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"vinview"];
    nextController.title=[words getword:@"wine"];
    [self.navigationController pushViewController:nextController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"crash");

    // Dispose of any resources that can be recreated.
}


- (IBAction)cancel_button:(id)sender
{
    [[self presentingViewController] dismissModalViewControllerAnimated:YES];
}


- (void)rateView:(RateView *)rateView ratingDidChange:(float)rating {
    
    if (![SingletonClass sharedInstance].username)
        return;
    int rating_int=rating;
    self.statusLabel.text = [NSString stringWithFormat:@"Rating: %d", rating_int];
    
    [SingletonClass sharedInstance].rating=rating;

    

    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailView *nextController = [storyboard instantiateViewControllerWithIdentifier:@"detailview"];
    nextController.gg=self;
    nextController.title=[words getword:@"rating"];
    [self.navigationController pushViewController:nextController animated:YES];
     
    
}



- (void)imgToFullScreen:(UITapGestureRecognizer *)pinchGestureRecognizer
{
    if (!isFullScreen) {
        [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
            //save previous frame
            prevFrame = _iw.frame;
            [_iw setFrame:[[UIScreen mainScreen] bounds]];
        }completion:^(BOOL finished){
            isFullScreen = true;
            _covert.hidden=false;
        }];
        return;
    } else {
        [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
            [_iw setFrame:prevFrame];
        }completion:^(BOOL finished){
            isFullScreen = false;
            _covert.hidden=true;
            
        }];
        return;
    }
}
@end