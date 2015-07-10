//
//  ContentViewController.m
//  Ivin
//
//  Created by user on 6/16/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "AllWineListViewController.h"
#import "SingletonClass.h"
#import "UIImage+Network.h"
#import "words.h"
#import "IvinHelp.h"
#import "HistoryViewCell.h"
#import "AcceptWineViewController.h"


@interface AllWineListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,retain) NSArray * listData;




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





@implementation AllWineListViewController



-(void)loaddata
{
 //   NSData* winelistdata;
 //   winelistdata=[IvinHelp geturlcontentintocache:@"http://www.ivintag.com/api/EndUserWine/WineList?enduserid=2"];

    
    if ([SingletonClass sharedInstance].searchmode)
    {
        _WineName =[[NSMutableArray alloc] initWithArray:[SingletonClass sharedInstance].WineName];
        _WineImageUrl=[[NSMutableArray alloc] initWithArray: [SingletonClass sharedInstance].WineImageUrl];
        _WineryName=[[NSMutableArray alloc] initWithArray: [SingletonClass sharedInstance].WineryName];
        _WineryCountry=[[NSMutableArray alloc] initWithArray: [SingletonClass sharedInstance].WineryCountry];
        _Appellation=[[NSMutableArray alloc] initWithArray: [SingletonClass sharedInstance].Appellation];
        _Year=[[NSMutableArray alloc] initWithArray: [SingletonClass sharedInstance].Year];
        _AverageMark=[[NSMutableArray alloc] initWithArray: [SingletonClass sharedInstance].AverageMark];
        _CreateDate=[[NSMutableArray alloc] initWithArray: [SingletonClass sharedInstance].CreateDate];
        _WineCode=[[NSMutableArray alloc] initWithArray: [SingletonClass sharedInstance].WineCode];
        _WineId=[[NSMutableArray alloc] initWithArray: [SingletonClass sharedInstance].WineId];
        return;
    }
    
    _WineName =[[NSMutableArray alloc] initWithObjects: nil];
    _WineImageUrl=[[NSMutableArray alloc] initWithObjects: nil];
    _WineryName=[[NSMutableArray alloc] initWithObjects: nil];
    _WineryCountry=[[NSMutableArray alloc] initWithObjects: nil];
    _Appellation=[[NSMutableArray alloc] initWithObjects: nil];
    _Year=[[NSMutableArray alloc] initWithObjects: nil];
    _AverageMark=[[NSMutableArray alloc] initWithObjects: nil];
    _CreateDate=[[NSMutableArray alloc] initWithObjects: nil];
    _WineCode=[[NSMutableArray alloc] initWithObjects: nil];
    _WineId=[[NSMutableArray alloc] initWithObjects: nil];
    _Like=[[NSMutableArray alloc] initWithObjects: nil];
    _Favorite=[[NSMutableArray alloc] initWithObjects: nil];

    
    NSString* filterregion=[SingletonClass sharedInstance].filterregion;
    //NSString* filtertype=[SingletonClass sharedInstance].filtertype;
    //NSString* filterappellation=[SingletonClass sharedInstance].filterappellation;
    NSString* filterwineryname=[SingletonClass sharedInstance].filterwineryname;
    
    for (int i=0; i<[SingletonClass sharedInstance].RegionName.count; i++)
    {
        
        NSString* left1= [[SingletonClass sharedInstance].RegionName objectAtIndex:i];
        //NSString* left2= [[SingletonClass sharedInstance].WineTypeName objectAtIndex:i];
        //NSString* left3= [[SingletonClass sharedInstance].Appellation objectAtIndex:i];
        NSString* left4= [[SingletonClass sharedInstance].WineryName objectAtIndex:i];
//        NSLog(@"aaa");
        if (([left1 isEqualToString:filterregion])   &&  ( [left4 isEqualToString:filterwineryname]  )  )
        {
            [_WineName addObject: [[SingletonClass sharedInstance].WineName objectAtIndex:i] ];
            [_WineImageUrl addObject: [[SingletonClass sharedInstance].WineImageUrl objectAtIndex:i] ];
            [_WineryName addObject: [[SingletonClass sharedInstance].WineryName objectAtIndex:i] ];
            [_WineryCountry addObject: [[SingletonClass sharedInstance].WineryCountry objectAtIndex:i] ];
            [_Appellation addObject: [[SingletonClass sharedInstance].Appellation objectAtIndex:i] ];
            [_Year addObject: [[SingletonClass sharedInstance].Year objectAtIndex:i] ];
            [_AverageMark addObject: [[SingletonClass sharedInstance].AverageMark objectAtIndex:i] ];
//            [_CreateDate addObject: [[SingletonClass sharedInstance].CreateDate objectAtIndex:i] ];
            [_WineCode addObject: [[SingletonClass sharedInstance].WineCode objectAtIndex:i] ];
            [_WineId addObject: [[SingletonClass sharedInstance].WineId objectAtIndex:i] ];
//            [_Like addObject: [[SingletonClass sharedInstance].Likewine objectAtIndex:i] ];
//            [Favorite addObject: [[SingletonClass sharedInstance].Favorite objectAtIndex:i]];
        }
    }

    
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loaddata];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.tableView setSeparatorColor:[UIColor colorWithWhite:1.0 alpha:0.0]];
    self.tableView.backgroundColor=[UIColor blackColor];
    self.view.backgroundColor=[UIColor blackColor];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_WineName count];
}

-(UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"historycell1";
    NSLog(@"begin");
    
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
    cell.priceLabel.text=@"9€";
    //cell.dateLabel.text=[_CreateDate objectAtIndex:indexPath.row];
    NSLog(@"end");
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
        [self performSelector:@selector(deselect) withObject:nil afterDelay:0.0f];
        return;
    }
    [IvinHelp wineparse:winestring];
    
    
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.0f];
    
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
