#import "UIImage+Network.h"
#import "HomepageController.h"
#import "AcceptWineViewController.h"
#import "words.h"
#import "HistoryViewCell.h"
#import "SingletonClass.h"
#import "IvinHelp.h"
#import "NewloginView.h"
#import "WQPlaySound.h"
#import "AllWineListViewController.h"
#import "AllWineViewController.h"
#import "SalonViewController.h"



@interface HomepageController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
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
@property(nonatomic,retain) NSMutableArray *Like;
@property(nonatomic,retain) NSMutableArray *Favorite;

@end



@implementation HomepageController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.searchBar.delegate=self;
    self.searchBar.barStyle=UIBarStyleBlackTranslucent;
    self.searchBar.placeholder=[words getword:@"wine/winery"];//@"Wine/Winery";
    //self.navigationItem.title=@"Ivin";//[words getword:@"mywines"];
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleFingerTap];
    singleFingerTap.delegate=self;
    UIImage *btnImage = [UIImage imageNamed:@"h1.png"];
    [_b1 setImage:btnImage forState:UIControlStateNormal];
    btnImage = [UIImage imageNamed:@"h2.png"];
    [_b2 setImage:btnImage forState:UIControlStateNormal];
    btnImage = [UIImage imageNamed:@"h3.png"];
    [_b3 setImage:btnImage forState:UIControlStateNormal];
    _l1.text=[words getword:@"h1"];
    _l2.text=[words getword:@"h2"];
    _l3.text=[words getword:@"h3"];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.tableView setSeparatorColor:[UIColor colorWithWhite:1.0 alpha:0.0]];
    self.tableView.backgroundColor=[UIColor blackColor];

    [self loaddata];
    
    
}
-(void)loaddata
{
    _WineName =[[NSMutableArray alloc] initWithObjects: nil];
    _WineImageUrl=[[NSMutableArray alloc] initWithObjects: nil];
    _WineryName=[[NSMutableArray alloc] initWithObjects: nil];
    _WineryCountry=[[NSMutableArray alloc] initWithObjects: nil];
    _Appellation=[[NSMutableArray alloc] initWithObjects: nil];
    _Year=[[NSMutableArray alloc] initWithObjects: nil];
    _AverageMark=[[NSMutableArray alloc] initWithObjects: nil];
//    _CreateDate=[[NSMutableArray alloc] initWithObjects: nil];
    _WineCode=[[NSMutableArray alloc] initWithObjects: nil];
    _WineId=[[NSMutableArray alloc] initWithObjects: nil];
    
    NSString* l=[SingletonClass sharedInstance].lang;
    if ((![l isEqual:@"en"])&& (![l isEqual:@"zh"]))
        l=@"fr";
    
    NSString * tmp;
    if (([l isEqual:@"en"])|| ([l isEqual:@"fr"]))
    {
        [_WineName addObject:@"Château de Montlys"];
        [_WineImageUrl addObject:@"http://www.ivintag.com/Content/Pictures/FR00001/FR00001006_Mobile.jpg"];
        [_WineryName addObject:@"Domaine Christophe SEMASKA"];
        [_WineryCountry addObject:@"France"];
        [_Appellation addObject:@"Côte-Rôtie"];
        [_Year addObject:@"2012"];
        [_AverageMark addObject:@"5.0"];
        [_WineCode addObject:@"FR00001006"];
        [_WineId addObject:@"58"];

    }
    else
    {
        [_WineName addObject:@"Château de Montlys"];
        [_WineImageUrl addObject:@"http://www.ivintag.com/Content/Pictures/FR00001/FR00001006_Mobile.jpg"];
        [_WineryName addObject:@"蒙利斯城堡酒庄"];
        [_WineryCountry addObject:@"法国"];
        [_Appellation addObject:@"罗蒂丘"];
        [_Year addObject:@"2012"];
        [_AverageMark addObject:@"5.0"];
        [_WineCode addObject:@"FR00001006"];
        [_WineId addObject:@"58"];
    }
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isDescendantOfView:_tableView]) {
        
        // Don't let selections of auto-complete entries fire the
        // gesture recognizer
        return NO;
    }
    return YES; // handle the touch
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
}


- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    [self.searchBar setShowsCancelButton:NO animated:YES];
    [self.searchBar resignFirstResponder];
}



-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    _searchBar.showsCancelButton=YES;
    [_searchBar setShowsCancelButton:YES animated:YES];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchstring = [self.searchBar.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString* l=[SingletonClass sharedInstance].lang;
    if ((![l isEqual:@"en"])&& (![l isEqual:@"zh"]))
        l=@"fr";

    NSString *searchurl= [NSString stringWithFormat:@"%@%@%@%@",@"http://www.ivintag.com/api/Wine/SearchWine?keyword=",searchstring,@"&lang=",l];
    
    
    
    NSData* winelistdata=[IvinHelp geturlcontentfromcache:searchurl];
    
    if ((!winelistdata)||([winelistdata length]==0))
    {
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:[words getword:@"error"] message:[words getword:@"networkerror"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
        return;
    }
    
    NSError *error;
    NSArray *winelist= [NSJSONSerialization JSONObjectWithData:winelistdata options:NSJSONReadingMutableLeaves error:&error];
    NSString * tmp;
    for (NSDictionary *wine in winelist) {
        tmp=[wine valueForKey:@"WineName"];
        [[SingletonClass sharedInstance].WineName addObject:tmp];
        tmp=[wine valueForKey:@"WineImageUrl"];
        [[SingletonClass sharedInstance].WineImageUrl addObject:tmp];
        tmp=[wine valueForKey:@"WineryName"];
        [[SingletonClass sharedInstance].WineryName addObject:tmp];
        tmp=[wine valueForKey:@"WineryCountry"];
        [[SingletonClass sharedInstance].WineryCountry addObject:tmp];
        tmp=[wine valueForKey:@"Appellation"];
        [[SingletonClass sharedInstance].Appellation addObject:tmp];
        tmp=[wine valueForKey:@"Year"];
        [[SingletonClass sharedInstance].Year addObject:tmp];
        tmp=[wine valueForKey:@"AverageMark"];
        if (tmp == nil || [tmp isKindOfClass:[NSNull class]])
            tmp=@"0";
        [[SingletonClass sharedInstance].AverageMark addObject:tmp];
        tmp=[wine valueForKey:@"WineCode"];
        [[SingletonClass sharedInstance].WineCode addObject:tmp];
        //tmp=[wine valueForKey:@"CreateDate"];
        tmp=@"";
        [[SingletonClass sharedInstance].CreateDate addObject:tmp];
        tmp=[wine valueForKey:@"WineId"];
        [[SingletonClass sharedInstance].WineId addObject:tmp];
        [[SingletonClass sharedInstance].Likewine addObject:tmp];
        tmp=[wine valueForKey:@"RegionName"];
        [[SingletonClass sharedInstance].RegionName addObject:tmp];
        tmp=[wine valueForKey:@"WineTypeName"];
        [[SingletonClass sharedInstance].WineTypeName addObject:tmp];
    }
    [SingletonClass sharedInstance].searchmode=true;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AllWineListViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"AllWine"];
//    nextController.title=[_classarray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:nextController animated:YES];

}


-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:NO animated:YES];
    [self.searchBar resignFirstResponder];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) b1click
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SalonViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"salon"];
    //    nextController.title=[_classarray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:nextController animated:YES];

}

-(IBAction) b2click
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AllWineViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"winefilter"];
    nextController.title=[words getword:@"salon"];
    nextController.filterlevel=0;
    [self.navigationController pushViewController:nextController animated:YES];

}

-(IBAction) b3click
{
    [self.tabBarController setSelectedIndex:0];
}
















/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_WineName count];
}

-(UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"historycell1";
    
    HistoryViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.backgroundColor=[UIColor blackColor];
    if (cell == nil){
        cell = [[HistoryViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    [cell.imageLable loadImageFromURL:[NSURL URLWithString:[_WineImageUrl objectAtIndex: indexPath.row ]] placeholderImage:nil cachingKey:[_WineImageUrl objectAtIndex:indexPath.row]];
    
    NSString * filePath;
    float ratingvalue=[[_AverageMark objectAtIndex:indexPath.row] floatValue];
    
    if (ratingvalue>=4.5)
        filePath=[[NSBundle mainBundle] pathForResource:@"50" ofType:@"png"];
    else if (ratingvalue>=3.5)
        filePath=[[NSBundle mainBundle] pathForResource:@"40" ofType:@"png"];
    else if (ratingvalue>=2.5)
        filePath=[[NSBundle mainBundle] pathForResource:@"30" ofType:@"png"];
    else if (ratingvalue>=1.5)
        filePath=[[NSBundle mainBundle] pathForResource:@"20" ofType:@"png"];
    else if (ratingvalue>=0.5)
        filePath=[[NSBundle mainBundle] pathForResource:@"10" ofType:@"png"];
    else
        filePath=[[NSBundle mainBundle] pathForResource:@"00" ofType:@"png"];
    
    UIImage * ratingImage = [UIImage imageWithContentsOfFile:filePath];//[UIImage imageNamed:@"40.png"];
    [cell.ratingLable setImage: ratingImage];
    cell.nameLabel.text= [_WineryName objectAtIndex:indexPath.row]; //@"Château pichon";
    cell.subnameLabel.text=[NSString stringWithFormat:@"%@ %@",[_WineName objectAtIndex:indexPath.row] , [_Year objectAtIndex:indexPath.row]];
    cell.subnameLabel2.text=[NSString stringWithFormat:@"%@, %@",[_Appellation objectAtIndex:indexPath.row] , [_WineryCountry objectAtIndex:indexPath.row]];//someString;//@"Pauillac, France";
    NSNumber *vvv=[_AverageMark objectAtIndex:indexPath.row];
    cell.ratingnumberLable.text=[[NSString alloc] initWithFormat:@"%0.1f",[vvv floatValue]];
    [_AverageMark objectAtIndex:indexPath.row];
    return cell;
}

- (void)deselect
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.navigationController.topViewController != self)
        return;
    
    int jj=indexPath.row;
    NSString *winenumber=[_WineCode objectAtIndex:jj];
    
    NSString* l=[SingletonClass sharedInstance].lang;
    if ((![l isEqual:@"en"])&& (![l isEqual:@"zh"]))
        l=@"fr";
    NSString * wineurl= [NSString stringWithFormat:@"%@%@%@%@",@"http://www.ivintag.com/api/wine?winecode=",winenumber,@"&lang=",l];
    NSData* winestring=[IvinHelp geturlcontentfromcache:wineurl];
    
    if ((!winestring)||([winestring length]==0))
    {
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:[words getword:@"error"] message:[words getword:@"networkerror"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
        [self performSelector:@selector(deselect) withObject:nil afterDelay:0.5f];
        return;
    }
    [IvinHelp wineparse:winestring];
    
    
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.5f];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AcceptWineViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"AcceptWine"];
    
    
    if (([SingletonClass sharedInstance].username!=nil))
    {
        [SingletonClass sharedInstance].skiphistory=0;
    }
    [self.navigationController pushViewController:nextController animated:YES];
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}







@end

