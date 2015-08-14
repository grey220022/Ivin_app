//
//  ThirdViewController.m
//  Ivin
//
//  Created by user on 2/27/14.
//  Copyright (c) 2014 user. All rights reserved.
//
#import "UIImage+Network.h"
#import "ThirdViewController.h"
#import "AcceptWineViewController.h"
#import "words.h"
#import "HistoryViewCell.h"
#import "SingletonClass.h"
#import "IvinHelp.h"
#import "NewloginView.h"
#import "WQPlaySound.h"



@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,retain) NSArray * listData;
@property(nonatomic,retain) NSArray * sublistData;
@property (nonatomic,retain) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIButton *b1;

@property (weak, nonatomic) IBOutlet UIButton *b2;
@property (weak, nonatomic) IBOutlet UIButton *b3;
@end


int wine_num,like_num,favorite_num;
bool filter_wine, first_time, networkerror;
NSMutableArray *WineName;
NSMutableArray *WineImageUrl;
NSMutableArray *WineryName;
NSMutableArray *WineryCountry;
NSMutableArray *Appellation;
NSMutableArray *Year;
NSMutableArray *AverageMark;
NSMutableArray *CreateDate;
NSMutableArray *WineCode;
NSMutableArray *WineId;
NSMutableArray *Like;
NSMutableArray *Favorite;
NSMutableArray *filterarray;




@implementation ThirdViewController


-(void)oov
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:[words getword:@"sort"]
                                  
                                                            delegate:self
                                  
                                                   cancelButtonTitle:[words getword:@"cancel"]
                                  
                                              destructiveButtonTitle:nil
                                  
                                                   otherButtonTitles:[words getword:@"sortbyname"],[words getword:@"sortbywinery"],[words getword:@"sortbyyear"],[words getword:@"sortbytype"],nil];
    
    actionSheet.actionSheetStyle =UIActionSheetStyleAutomatic;
    [actionSheet showInView:self.view];
}


- (IBAction)allwines:(id)sender {
    if ([SingletonClass sharedInstance].skiphistory==0)
        [self loaddata];
    filter_wine=false;
    [_tableView reloadData];
}


- (IBAction)likefilter:(id)sender {
    if ([SingletonClass sharedInstance].skiphistory==0)
        [self loaddata];
    filter_wine=true;
    filterarray=[[NSMutableArray alloc] initWithObjects: nil];
    int objectnumber=[WineName count];
    for (int i=0; i<objectnumber; i++)
    {
        if ([[Like objectAtIndex:i] isEqual:@"true"])
        {
            //NSLog(@"%d",i);
            [filterarray addObject:[NSNumber numberWithInteger:i]];
        }
    }
    [_tableView reloadData];
}

- (IBAction)collectfilter:(id)sender {
    if ([SingletonClass sharedInstance].skiphistory==0)
        [self loaddata];
    filter_wine=true;
    int objectnumber=[WineName count];
    filterarray=[[NSMutableArray alloc] initWithObjects: nil];
    for (int i=0; i<objectnumber; i++)
    {
        //NSLog(@"%@",[Favorite objectAtIndex:i]);
        if ([[Favorite objectAtIndex:i] isEqual:@"true"])
        {
            //NSLog(@"%d",i);
            [filterarray addObject:[NSNumber numberWithInteger:i]];
        }
    }
    [_tableView reloadData];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:@"名字排序"]) {
        //NSLog(@"Cancel pressed --> 1");
    }
    if ([buttonTitle isEqualToString:@"酒庄排序"]) {
        //NSLog(@"Cancel pressed --> 2");
    }
    if ([buttonTitle isEqualToString:@"年份排序"]) {
        //NSLog(@"Cancel pressed --> 3");
    }
    
}

- (void)getwinedata:(NSString *) url
{
    
    
}


-(void)viewDidAppear:(BOOL)animated
{
    [SingletonClass sharedInstance].listview=self;
    //NSLog(@"thirdappear");
    if ([SingletonClass sharedInstance].fromscan==1)
    {
        if ([SingletonClass sharedInstance].username!=nil)
            [SingletonClass sharedInstance].skiphistory=0;
        //NSLog(@"3");
        //NSLog(@"%@",[SingletonClass sharedInstance].wine.Wine);
        
        //NSLog(@"%@",[SingletonClass sharedInstance].winery.Name);
        
        
        //NSLog(@"4");
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        AcceptWineViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"AcceptWine"];
        [self.navigationController pushViewController:nextController animated:YES];
        [[SingletonClass sharedInstance].homeview.navigationController popToRootViewControllerAnimated:NO];

        [SingletonClass sharedInstance].fromscan=0;
        return;
    }
    
    
    if ([SingletonClass sharedInstance].skiphistory==0)
    {
        networkerror=false;
        [self loaddata];
        if (networkerror)
        {
            [_activityIndicator stopAnimating];
            return;
        }
    }

    if ([SingletonClass sharedInstance].username==nil)
    {
        if ([[SingletonClass sharedInstance].preview isEqual:@"login"])
        {
            [self.tabBarController setSelectedIndex:0];
            return;
        }
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        NewloginView *newloginview = [storyboard instantiateViewControllerWithIdentifier:@"newloginview"];
        
        [self presentModalViewController:newloginview animated:YES];

        return;
    }
    else{
        filter_wine=false;
        [_tableView reloadData];
    }
    [_activityIndicator stopAnimating];
}

/*

-(void)viewWillAppear:(BOOL)animated
{
    
    

}
*/
-(void)loaddata
{
    if ([SingletonClass sharedInstance].username==nil)
        return;
    
    //        NSData* winelistdata=[IvinHelp geturlcontent:@"http://lapinroi-001-site1.smarterasp.net/api/EndUserWine/WineList?enduserid=1"];
    NSData* winelistdata;
    NSString* l=[SingletonClass sharedInstance].lang;
    if ((![l isEqual:@"en"])&& (![l isEqual:@"zh"]))
        l=@"fr";

    if (first_time)
    {
        winelistdata=[IvinHelp geturlcontentfromcache:[NSString stringWithFormat:@"http://www.ivintag.com/api/EndUserWine/WineList?enduserid=%@&lang=%@", [SingletonClass sharedInstance].username,l]];
        first_time=false;
    }
    else
    {

    winelistdata=[IvinHelp geturlcontentintocache:[NSString stringWithFormat:@"http://www.ivintag.com/api/EndUserWine/WineList?enduserid=%@&lang=%@", [SingletonClass sharedInstance].username,l]];
    }
    //NSString * bc=[NSString stringWithFormat:@"http://www.ivintag.com/api/EndUserWine/WineList?enduserid=%@", [SingletonClass sharedInstance].username];
    
   // NSLog(@"%@",bc);
    
    if ((!winelistdata)||([winelistdata length]==0))
    {
        networkerror=true;
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:[words getword:@"error"] message:[words getword:@"networkerror"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
        return;
    }
    
    WineName =[[NSMutableArray alloc] initWithObjects: nil];
    WineImageUrl=[[NSMutableArray alloc] initWithObjects: nil];
    WineryName=[[NSMutableArray alloc] initWithObjects: nil];
    WineryCountry=[[NSMutableArray alloc] initWithObjects: nil];
    Appellation=[[NSMutableArray alloc] initWithObjects: nil];
    Year=[[NSMutableArray alloc] initWithObjects: nil];
    AverageMark=[[NSMutableArray alloc] initWithObjects: nil];
    CreateDate=[[NSMutableArray alloc] initWithObjects: nil];
    WineCode=[[NSMutableArray alloc] initWithObjects: nil];
    WineId=[[NSMutableArray alloc] initWithObjects: nil];
    Like=[[NSMutableArray alloc] initWithObjects: nil];
    Favorite=[[NSMutableArray alloc] initWithObjects: nil];
    
    
    
    NSError *error;
    NSArray *winelist= [NSJSONSerialization JSONObjectWithData:winelistdata options:NSJSONReadingMutableLeaves error:&error];
    
    // NSString* newStr = [[NSString alloc] initWithData:winelistdata encoding:NSUTF8StringEncoding];
    
    //NSLog(@"%@",newStr);
    
    NSString * tmp;
    favorite_num=like_num=0;
    for (NSDictionary *wine in winelist) {
        tmp=[wine valueForKey:@"WineName"];
        [WineName addObject:tmp];
        tmp=[wine valueForKey:@"WineImageUrl"];
        [WineImageUrl addObject:tmp];
        tmp=[wine valueForKey:@"WineryName"];
        [WineryName addObject:tmp];
        tmp=[wine valueForKey:@"WineryCountry"];
        [WineryCountry addObject:tmp];
        tmp=[wine valueForKey:@"Appellation"];
        [Appellation addObject:tmp];
        tmp=[wine valueForKey:@"Year"];
        [Year addObject:tmp];
        tmp=[wine valueForKey:@"AverageMark"];
        if (tmp == nil || [tmp isKindOfClass:[NSNull class]])
            tmp=@"0";//[[NSNumber alloc] initWithFloat: 0.0];
        [AverageMark addObject:tmp];
        tmp=[wine valueForKey:@"WineCode"];
        [WineCode addObject:tmp];
        tmp=[wine valueForKey:@"CreateDate"];
        [CreateDate addObject:tmp];
        
        tmp=[wine valueForKey:@"WineId"];
        [WineId addObject:tmp];
        
        tmp=[wine valueForKey:@"Like"];
        if ((tmp == nil) || ([tmp isKindOfClass:[NSNull class]]) || (![tmp boolValue]))
            tmp=@"false";
        else tmp=@"true";
        [Like addObject:tmp];
        
        //NSLog(@"%@",tmp);
        if ([tmp isEqual:@"true"])
        {
            like_num++;
        }
        
        tmp=[wine valueForKey:@"Favorite"];
        if ((tmp == nil) || ([tmp isKindOfClass:[NSNull class]]) || (![tmp boolValue]))
            tmp=@"false";
        else tmp=@"true";
        [Favorite addObject:tmp];
        if ([tmp isEqual:@"true"])
        {
            favorite_num++;
        }
    }
    wine_num=WineName.count;
    [SingletonClass sharedInstance].skiphistory=1;
    _t1.text=[NSString stringWithFormat:@"%d %@",wine_num,[words getword:@"wines"]];
    _t2.text=[NSString stringWithFormat:@"%d",like_num];
    _t3.text=[NSString stringWithFormat:@"%d",favorite_num];
    _t2.textColor=[UIColor whiteColor];
    _t3.textColor=[UIColor whiteColor];
    int jj=[WineImageUrl count];
    NSLog(@"%dxxxxxxxxxxxxxx",jj);
}

- (void)viewDidLoad
{
    //NSLog(@"thirddidload");
    
    first_time=true;
    if ([SingletonClass sharedInstance].username==nil)
    {
        first_time=false;
    }
    
    [super viewDidLoad];
    
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] init];
    barButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = barButtonItem;
    
    
    _activityIndicator = [[UIActivityIndicatorView alloc]
                          initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    [_activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:_activityIndicator];
    _activityIndicator.center=CGPointMake(160, 250);
    _activityIndicator.hidesWhenStopped = YES;
    
    
    
    
    NSArray *array=[[NSArray alloc] initWithObjects:@"Vin 1",@"Vin 2",@"Vin 3",@"Vin 4",@"Vin 5",@"Vin 6",nil];
    NSArray *subarray=[[NSArray alloc] initWithObjects:@"detail 1",@"detail 1",@"detail 1",@"detail 1",@"detail 1",@"detail 1",nil];
    self.listData=array;
    self.sublistData=subarray;
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.searchBar.delegate=self;
    
    [self.tableView setSeparatorColor:[UIColor colorWithWhite:1.0 alpha:0.0]];
    
    //self.searchBar.backgroundColor=[UIColor colorWithRed:235.0f/255.0f green:216.0f/255.0f blue:145.0f/255.0f alpha:0.0];
    self.searchBar.barStyle=UIBarStyleBlackTranslucent;
    
    
    
    
    /*
     self.searchBar.backgroundColor=[UIColor clearColor];
     [[self.searchBar.subviews objectAtIndex:0]removeFromSuperview];
     for (UIView *subview in self.searchBar.subviews)
     {
     if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
     {
     [subview removeFromSuperview];
     break;
     }
     }*/
    
    
    // UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"排序" style:UIBarButtonItemStylePlain target:self action:@selector(oov)];
    
    //    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sort.png"]] ];
    
//Todo: Add the sort feature
    /*
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"noirnew.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(oov)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    */
    
    self.navigationItem.title=[words getword:@"mywines"];
    //self.navigationController.title=@"fadsfds";//[words getword:@"mywines"];
    //self.navigationItem.rightBarButtonItem = rightButton;
    
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    [self.tableView setBackgroundColor:[UIColor blackColor]];
    //  _sw.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];
    
    /*
     if ([SingletonClass sharedInstance].fromscan==1)
     {
     [SingletonClass sharedInstance].fromscan=0;
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     AcceptWineViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"AcceptWine"];
     [self.navigationController pushViewController:nextController animated:YES];
     }
     */
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [SingletonClass sharedInstance].preview=@"history";
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}


//3
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (!filter_wine)
        return wine_num;
    else
    {
       // NSLog(@"%d",[filterarray count]);
        return [filterarray count];
    }
    //return [self.listData count];
}

//4
-(UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        NSLog(@"Abegin");
    static NSString *cellIdentifier = @"historycell";
    HistoryViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.backgroundColor=[UIColor blackColor];
    if (cell == nil){
        cell = [[HistoryViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    NSLog(@"1+");
    
    int jj=[WineImageUrl count];
    NSLog(@"%d",jj);
    
    [cell.imageLable loadImageFromURL:[NSURL URLWithString:[WineImageUrl objectAtIndex: [self getvalue:indexPath.row] ]] placeholderImage:nil cachingKey:[WineImageUrl objectAtIndex:[self getvalue:indexPath.row]]];
    
    NSLog(@"2+");
    
    NSString * filePath;
    float ratingvalue=[[AverageMark objectAtIndex:[self getvalue:indexPath.row]] floatValue];
    NSLog(@"3");

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
    NSLog(@"4");
    UIImage * ratingImage = [UIImage imageWithContentsOfFile:filePath];//[UIImage imageNamed:@"40.png"];
    [cell.ratingLable setImage: ratingImage];
    cell.nameLabel.text= [WineryName objectAtIndex:[self getvalue:indexPath.row]]; //@"Château pichon";
    cell.subnameLabel.text=[NSString stringWithFormat:@"%@ %@",[WineName objectAtIndex:[self getvalue:indexPath.row]] , [Year objectAtIndex:[self getvalue:indexPath.row]]];
    NSLog(@"5");
    cell.subnameLabel2.text=[NSString stringWithFormat:@"%@, %@",[Appellation objectAtIndex:[self getvalue:indexPath.row]] , [WineryCountry objectAtIndex:[self getvalue:indexPath.row]]];//someString;//@"Pauillac, France";
    NSNumber *vvv=[AverageMark objectAtIndex:[self getvalue:indexPath.row]];
    cell.ratingnumberLable.text=[[NSString alloc] initWithFormat:@"%0.1f",[vvv floatValue]];
    NSLog(@"6");
    [AverageMark objectAtIndex:[self getvalue:indexPath.row]];//@"4.0";
    cell.priceLabel.text=@"9€";
    NSLog(@"7");
    cell.dateLabel.text=[CreateDate objectAtIndex:[self getvalue:indexPath.row]];
        NSLog(@"Aend");
    return cell;
}
/*
 -(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
 {
 //我们设分区标题，不设分区标尾
 NSLog(@"there");
 return @"喝酒历史纪录";
 }
 */

- (void)deselect
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

-(void)actIndicatorBegin
{
    [_activityIndicator startAnimating];
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.navigationController.topViewController != self)
        return;

    
    [NSThread detachNewThreadSelector: @selector(actIndicatorBegin) toTarget:self withObject:nil];
    
    //[_activityIndicator startAnimating];
    
    
    //NSData* winestring=[IvinHelp geturlcontent:@"http://www.ivindigital.com/api/wine/5"];
    //NSData* winerystring=[IvinHelp geturlcontent:@"http://www.ivindigital.com/api/winery/8"];
    
    
    //NSData* winestring=[IvinHelp geturlcontent:@"http://lapinroi-001-site1.smarterasp.net/api/wine/5"];
    //NSData* winerystring=[IvinHelp geturlcontent:@"http://lapinroi-001-site1.smarterasp.net/api/winery/5"];
    NSString *winenumber=[WineCode objectAtIndex:[self getvalue:indexPath.row]];
    
    
    NSString* l=[SingletonClass sharedInstance].lang;
    if ((![l isEqual:@"en"])&& (![l isEqual:@"zh"]))
      l=@"fr";
    NSString * wineurl= [NSString stringWithFormat:@"%@%@%@%@",@"http://www.ivintag.com/api/wine?winecode=",winenumber,@"&lang=",l];
    NSData* winestring=[IvinHelp geturlcontentfromcache:wineurl];
    
   // NSLog(@"%@",wineurl);
    
    //if ((!winerystring) || (!winestring)||([winestring length]==0)||([winerystring length]==0))
    if ((!winestring)||([winestring length]==0))
    {
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:[words getword:@"error"] message:[words getword:@"networkerror"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
        [self performSelector:@selector(deselect) withObject:nil afterDelay:0.0f];
        [_activityIndicator stopAnimating];
        return;
    }
    
    
   // [IvinHelp wineryparse:winerystring];
    [IvinHelp wineparse:winestring];
    
    //[NSThread sleepForTimeInterval:10000];
    [_activityIndicator stopAnimating];
    
    
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.0f];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AcceptWineViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"AcceptWine"];
    //nextController.title=@"语言";
    [self.navigationController pushViewController:nextController animated:YES];
    [[SingletonClass sharedInstance].homeview.navigationController popToRootViewControllerAnimated:NO];

}

/*
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
 NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
 AcceptWineViewController *destViewController = segue.destinationViewController;
 
 //Recipe *recipe = [recipes objectAtIndex:indexPath.row];
 //destViewController.recipe = recipe;
 }
 }
 */


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    //[searchBar setShowsCancelButton:NO animated:YES];
    [self.searchBar setShowsCancelButton:NO animated:YES];
    
    [self.searchBar resignFirstResponder];
    /*
     */
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //[dataArray removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source.
        wine_num--;
        _t1.text=[NSString stringWithFormat:@"%d %@",wine_num,[words getword:@"wines"]];
        
        
//        NSLog(@"%d",indexPath.row);
        
        NSString * userid, *wineid;
        wineid=[WineId objectAtIndex:[self getvalue:indexPath.row]];
        
        if ([[Like objectAtIndex:[self getvalue:indexPath.row]]  isEqual: @"true"])
        {
            like_num--;
            _t2.text=[NSString stringWithFormat:@"%d",like_num];
            _t2.textColor=[UIColor whiteColor];
            
        }
        
        if ([[Favorite objectAtIndex:[self getvalue:indexPath.row]]  isEqual: @"true"])
        {
            favorite_num--;
            _t3.text=[NSString stringWithFormat:@"%d",favorite_num];
            _t3.textColor=[UIColor whiteColor];
        }
        
        [WineName removeObjectAtIndex:[self getvalue:indexPath.row]];
        [WineImageUrl removeObjectAtIndex:[self getvalue:indexPath.row]];
        [WineryName removeObjectAtIndex:[self getvalue:indexPath.row]];
        [WineryCountry removeObjectAtIndex:[self getvalue:indexPath.row]];
        [Appellation removeObjectAtIndex:[self getvalue:indexPath.row]];
        [Year removeObjectAtIndex:[self getvalue:indexPath.row]];
        [AverageMark removeObjectAtIndex:[self getvalue:indexPath.row]];
        [WineCode removeObjectAtIndex:[self getvalue:indexPath.row]];
        [CreateDate removeObjectAtIndex:[self getvalue:indexPath.row]];
        [WineId removeObjectAtIndex:[self getvalue:indexPath.row]];
        [Like removeObjectAtIndex:[self getvalue:indexPath.row]];
        [Favorite removeObjectAtIndex:[self getvalue:indexPath.row]];
        [filterarray removeObjectAtIndex:indexPath.row];
        NSString *urlString = [NSString stringWithFormat:@"http://www.ivintag.com/api/EndUserWine"];
        NSURL *url = [NSURL URLWithString:urlString];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"DELETE"];
        [request setValue:@"Fiddler" forHTTPHeaderField:@"User-Agent"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
        [request setValue:@"www.ivintag.com" forHTTPHeaderField:@"Host"];
        [request setValue:@"220" forHTTPHeaderField:@"Content-Length"];
        
        userid=[SingletonClass sharedInstance].username;
        NSString *bodyStr = [NSString stringWithFormat:@"{\"WineId\":\"%@\",\"EndUserId\":\"%@\"}",wineid ,userid];
        NSData *body = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
        //NSLog(@"body data :%@", bodyStr);
        [request setHTTPBody:body];
        NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:nil];
        [conn start];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [SingletonClass sharedInstance].skiphistory=0;
        //[self performSelectorInBackground:@selector(loadcache) withObject:nil];
        
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        NSString* l=[SingletonClass sharedInstance].lang;
        if ((![l isEqual:@"en"])&& (![l isEqual:@"zh"]))
            l=@"fr";
        dispatch_after(popTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                       ^(void){
                           [IvinHelp geturlcontentintocache:[NSString stringWithFormat:@"http://www.ivintag.com/api/EndUserWine/WineList?enduserid=%@&lang=%@", [SingletonClass sharedInstance].username,l]];
                       });
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
 
}








// 事件：搜索框开始输入字符
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    // 进入搜索状态
    //    isSearchOn = YES;
    
    // 不能选择行
    //  canSelectRow = NO;
    
    // 关闭滚动条的显示
    //  self.tableView.scrollEnabled = NO;
    
    //[searchBar resignFirstResponder];
    //NSLog(@"begin editing");
    _searchBar.showsCancelButton=YES;
    [_searchBar setShowsCancelButton:YES animated:YES];
    
}




// 事件：搜索框中文字发生变化触发
-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    /*
     if ([searchText length]>0)
     {
     //    isSearchOn = YES;
     //    canSelectRow = YES;
     //    self.tableView.scrollEnabled = YES;
     [self searchMoviesTableView];
     }
     else
     {
     isSearchOn = NO;
     canSelectRow = NO;
     self.tableView.scrollEnabled = NO;
     }
     [self.tableView reloadData];*/
}

// 方法：搜索结果
/*
 -(void) searchMoviesTableView
 {
 [searchResult removeAllObjects];
 for (NSString *str in listOfMovies) {
 NSRange titleResultsRange=[str rangeOfString:searchBar.text
 options:NSCaseInsensitiveSearch];
 if(titleResultsRange.length>0)
 [searchResult addObject:str];
 }
 
 }
 
 */

// 事件：键盘上的搜索按钮事件
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //NSLog(@"search clicked");
    [searchBar resignFirstResponder];
    
    if ([SingletonClass sharedInstance].skiphistory==0)
        [self loaddata];
    filter_wine=true;
    filterarray=[[NSMutableArray alloc] initWithObjects: nil];
    NSString *searchstring = [self.searchBar.text stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //NSLog(@"%@",searchstring);
    int objectnumber=[WineName count];
    for (int i=0; i<objectnumber; i++)
    {
//        NSLog(@"%@",[WineName objectAtIndex:i]);
        NSRange r1= [[WineName objectAtIndex:i]  rangeOfString: searchstring options: NSCaseInsensitiveSearch];
        //NSLog(@"1");
        NSRange r2= [[WineryName objectAtIndex:i]  rangeOfString: searchstring options: NSCaseInsensitiveSearch];
        //NSLog(@"2");
        NSRange r3= [[[Year objectAtIndex:i] stringValue]  rangeOfString: searchstring options: NSCaseInsensitiveSearch];
        //NSLog(@"3");
        NSRange r4= [[Appellation objectAtIndex:i]  rangeOfString: searchstring options: NSCaseInsensitiveSearch];
        //NSLog(@"4");
        NSRange r5= [[WineryCountry objectAtIndex:i]  rangeOfString: searchstring options: NSCaseInsensitiveSearch];
        //NSLog(@"5");
       if ((r1.location!=NSNotFound) || (r2.location!=NSNotFound) || (r3.location!=NSNotFound) ||(r4.location!=NSNotFound) ||(r5.location!=NSNotFound))
       {
          // NSLog(@"%d",i);
           [filterarray addObject:[NSNumber numberWithInteger:i]];
       }
       /*
        NSRange r1= [[WineName objectAtIndex:i]  rangeOfString: searchstring options: NSCaseInsensitiveSearch];
        NSRange r2= [[Year objectAtIndex:i]  rangeOfString: searchstring options: NSCaseInsensitiveSearch];
        
        NSRange r3= [[WineryName objectAtIndex:i]  rangeOfString: searchstring options:
                     NSCaseInsensitiveSearch];
        if ((r1.location==NSNotFound) && (r2.location==NSNotFound) && (r3.location==NSNotFound))
        {
            [WineryName removeObjectAtIndex:i];
            [WineImageUrl removeObjectAtIndex:i];
            [WineName removeObjectAtIndex:i];
            [WineryCountry removeObjectAtIndex:i];
            [Appellation removeObjectAtIndex:i];
            [Year removeObjectAtIndex:i];
            [AverageMark removeObjectAtIndex:i];
            [CreateDate removeObjectAtIndex:i];
            [WineCode removeObjectAtIndex:i];
        }*/
    }
    [self.tableView reloadData];
    
}

// 事件：搜索框里取消按钮事件
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    
    //isSearchOn = NO;
    //canSelectRow = YES;
    //self.tableView.scrollEnabled = YES;
    //self.navigationItem.rightBarButtonItem = nil;
    [searchBar setShowsCancelButton:NO animated:YES];
    [self.searchBar resignFirstResponder];
    //[self.tableView reloadData];
    
}

//-(BOOL)searchBarShouldBeginEditing:(UISearchBar *) searchBar
//{
//    return NO;
//}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [_activityIndicator stopAnimating];
}

-(NSInteger)getvalue:(NSInteger) pam
{
    if (!filter_wine)
        return pam;
    else
        return [[filterarray objectAtIndex:pam] integerValue];
}



@end
