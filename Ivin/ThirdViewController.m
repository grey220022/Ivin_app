//
//  ThirdViewController.m
//  Ivin
//
//  Created by user on 2/27/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "ThirdViewController.h"
#import "AcceptWineViewController.h"
#import "words.h"
#import "HistoryViewCell.h"
#import "SingletonClass.h"
#import "IvinHelp.h"



@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,retain) NSArray * listData;
@property(nonatomic,retain) NSArray * sublistData;
@property (nonatomic,retain) IBOutlet UISearchBar *searchBar;
//@property (strong) UIActivityIndicatorView *activityIndicator;

//-(void)refreshPropertyList;

@end

@implementation ThirdViewController


//@"zh.mywines",@"zh.sort",@"zh.sortbyname",@"zh.sortbywinery",@"zh.sortbyyear",@"zh.sortbytype",

-(void)oov
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:[words getword:@"sort"]
                                  
                                                           delegate:self
                                  
                                                  cancelButtonTitle:[words getword:@"cancel"]
                                  
                                             destructiveButtonTitle:nil
                                  
                                                  otherButtonTitles:[words getword:@"sortbyname"],[words getword:@"sortbywinery"],[words getword:@"sortbyyear"],[words getword:@"sortbytype"],nil];
    
    actionSheet.actionSheetStyle =UIActionSheetStyleAutomatic;
    
    // [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
    
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];

    if ([buttonTitle isEqualToString:@"名字排序"]) {
        NSLog(@"Cancel pressed --> 1");
    }
    if ([buttonTitle isEqualToString:@"酒庄排序"]) {
        NSLog(@"Cancel pressed --> 2");
    }
    if ([buttonTitle isEqualToString:@"年份排序"]) {
        NSLog(@"Cancel pressed --> 3");
    }

}

- (void)getwinedata:(NSString *) url
{
    
    
}


-(void)viewWillAppear:(BOOL)animated
{
    
    [SingletonClass sharedInstance].listview=self;
    NSLog(@"thirdappear");
    if ([SingletonClass sharedInstance].fromscan==1)
    {
        
        NSLog(@"3");
        NSLog(@"%@",[SingletonClass sharedInstance].wine.Wine);
        
        NSLog(@"%@",[SingletonClass sharedInstance].winery.Name);

        
        NSLog(@"4");
        
        [SingletonClass sharedInstance].fromscan=0;
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        AcceptWineViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"AcceptWine"];
        [self.navigationController pushViewController:nextController animated:YES];
    }
}



- (void)viewDidLoad
{
    NSLog(@"thirddidload");

    [super viewDidLoad];
    
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
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"noirnew.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(oov)];

    self.navigationItem.rightBarButtonItem = rightButton;
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




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}


//3
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listData count];
}

//4
-(UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"historycell";
    HistoryViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil){
        // 这种方式，将会调用cell中的initWithStyle方法
        cell = [[HistoryViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    UIImage * bgImage =[UIImage imageNamed:@"wine.jpg"];
    [cell.imageLable setImage:bgImage];
    //cell.nameLabel=@"xxxxx";
    cell.nameLabel.text=@"Château pichon 2009";
    cell.priceLabel.text=@"9€";
    cell.dateLabel.text=@"12/12/2009";
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    
    
    //static NSString *cellIdentifier = @"WineCell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    /*
     NSString *tweet;
     if (indexPath.section==0)
     {
     tweet = [self.listData objectAtIndex:indexPath.row];
     }
     else
     {
     tweet= [self.grapeData objectAtIndex:indexPath.row];
     }*/
    
    //NSArray *arrtitle=[[NSArray alloc] initWithObjects:@"Tasting Notes",@"Wine's Rank",@"Winery",@"Grapes",@"Food Pairing",nil];
    
    //NSString *subtweet = [arrtitle objectAtIndex:indexPath.row];
    
    //[cell.textLabel setText:subtweet];
    
    
    //UIImage * bgImage =[UIImage imageNamed:@"wine.jpg"];
    //[cell.imageView setImage:bgImage];
    //   [cell.detailTextLabel setText:subtweet];
    //return cell;
    
    
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

    
    [NSThread detachNewThreadSelector: @selector(actIndicatorBegin) toTarget:self withObject:nil];
    
    //[_activityIndicator startAnimating];
    
    
    NSData* winestring=[IvinHelp geturlcontent:@"http://www.ivindigital.com/api/wine/5"];
    NSData* winerystring=[IvinHelp geturlcontent:@"http://www.ivindigital.com/api/winery/8"];
    
    if ((!winerystring) || (!winestring)||([winestring length]==0)||([winerystring length]==0))
    {
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:@"Network error" message:@"Please try it later." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
        [self performSelector:@selector(deselect) withObject:nil afterDelay:0.0f];
        return;
    }
    
    
    [IvinHelp wineryparse:winerystring];
    [IvinHelp wineparse:winestring];
    
    //[NSThread sleepForTimeInterval:10000];
    [_activityIndicator stopAnimating];

    
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.0f];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AcceptWineViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"AcceptWine"];
    //nextController.title=@"语言";
    [self.navigationController pushViewController:nextController animated:YES];
    
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
    
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //[dataArray removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
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
    NSLog(@"search clicked");
    [searchBar resignFirstResponder];
   // [self searchMoviesTableView];
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

@end
