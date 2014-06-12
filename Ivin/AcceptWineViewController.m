//
//  AcceptWineViewController.m
//  Ivin
//
//  Created by user on 3/1/14.
//  Copyright (c) 2014 user. All rights reserved.
//

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

@interface AcceptWineViewController ()
//@property(nonatomic,retain) UIWebView *webView;

@property(nonatomic,retain) NSArray * listData;
@property(nonatomic,retain) NSArray * grapeData;

@property(nonatomic,retain) NSArray * sublistData;

@end



@implementation AcceptWineViewController
@synthesize rateView;
@synthesize statusLabel;
@synthesize price;
@synthesize personalnote;

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
    //self.view.contentSize=CGSizeMake(400,400);
    //self.navigationController.title=@"fdasf";
    self.navigationItem.title=@"Chateau XXX";
   // UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sort.png"]]];
   // self.navigationItem.rightBarButtonItem = rightButton;
    
    
//    self.navigationController.navigationBar.te
    //navigationBar.tintColor=[UIColor colorWithRed:235.0f/255.0f green:216.0f/255.0f blue:145.0f/255.0f alpha:1.0f];
    //barTintColor=[UIColor colorWithRed:235.0f/255.0f green:216.0f/255.0f blue:145.0f/255.0f alpha:1.0f];
    [_sw setScrollEnabled:YES];
    //[_sw setContentSize:CGSizeMake(320, 2200)];
    
    [_sw setContentSize:CGSizeMake(320, 700)];
    
    _sw.delegate=self;
    self.rateView.notSelectedImage = [UIImage imageNamed:@"kermit_empty.png"];
    self.rateView.halfSelectedImage = [UIImage imageNamed:@"kermit_half.png"];
    self.rateView.fullSelectedImage = [UIImage imageNamed:@"kermit_full.png"];
    //self.rateView.rating = 3;
    self.rateView.editable = YES;
    self.rateView.maxRating = 5;
    self.rateView.delegate = self;
    self.statusLabel.text=@"Rating: 0";
    //self.description.numberOfLines = 0;
    [self.description sizeToFit];
    self.description.lineBreakMode=UILineBreakModeWordWrap;
    
    self.pair.numberOfLines = 0;
    [self.pair sizeToFit];
    
    
    
  //  [self.nameandyear setNumberOfLines:0];
    _nameandyear.lineBreakMode = UILineBreakModeWordWrap;
    _nameandyear.numberOfLines = 0;
    [_nameandyear sizeToFit];
    
    //[_commenttext se;
    
    //UIImageView *someImageView
   // _iw= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wine.jpg"]];
    [_iw setImage:[UIImage imageNamed:@"wine.jpg"]];
    //someImageView.image = someImage;
    //[self.view addSubview:someImageView];
    
    
    //[_iw addSubview:];
    
    
    
    // Do any additional setup after loading the view from its nib.
  //  _webView.userInteractionEnabled = true;
  // [_webView loadRequest:[[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:@"http://en.wikipedia.org/wiki/Wine"]]];
    
   // NSURL *url = [[NSURL alloc] initWithString:@"https://www.google.fr"];
   // NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
   // self.webView.scalesPageToFit = YES;
   // [self.webView loadRequest:request];

   // self.tableview.delegate=self;
    
    NSArray *array=[[NSArray alloc] initWithObjects:@"酒的故事",@"葡萄种类",@"评论",nil];
//    NSArray *subarray=[[NSArray alloc] initWithObjects:@"detail 1",@"detail 1",@"detail 1",@"detail 1",@"detail 1",@"detail 1",nil];
    self.listData=array;
    array=[[NSArray alloc] initWithObjects:@"第一种葡萄",@"第二种葡萄",@"第三种葡萄",nil];
    self.grapeData=array;
    //self.tableview.delegate=self;
    //self.tableview.dataSource=self;
    //self.tableview.backgroundColor=[UIColor whiteColor];
    //self.tableview.style=UITableViewStyleGrouped;
    
    self.personalnote.text=@"点击此编辑品酒日记";
    self.personalnote.layer.borderWidth =1.0;
    self.personalnote.layer.cornerRadius =5.0;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tapGesture.cancelsTouchesInView = NO;
    
    [ price setKeyboardType:UIKeyboardTypeNumbersAndPunctuation ];
    
    [_sw addGestureRecognizer:tapGesture];
    
    
    //UIImage *swi=[UIImage imageNamed:@"3.png"];
    //UIImageView *imageView = [[UIImageView alloc] initWithImage:swi];
    
    //[_sw addSubview:imageView ];
    //[_sw sendSubviewToBack:imageView ];
    _sw.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];
    self.newtable.dataSource=self;
    self.newtable.delegate=self;
    self.newtable.backgroundColor=[UIColor clearColor];
    [self.newtable setSeparatorColor:[UIColor colorWithRed:235.0f/255.0f green:216.0f/255.0f blue:145.0f/255.0f alpha:0.0]];
    //[self.newtable setSeparatorColor:[UIColor colorWithRed:235.0f/255.0f green:216.0f/255.0f blue:145.0f/255.0f alpha:1.0]];
    
    
    _la1.text=[words getword:@"grape"];
    _la2.text=[words getword:@"wine"];
    _la3.text=[words getword:@"winery"];
    _la4.text=[words getword:@"recommandationofwinemaker"];
    _la5.text=[words getword:@"averagerating"];
    _la6.text=[words getword:@"averageprice"];
    NSString* num=@"189 ";
    _la7.text=[num stringByAppendingString:[words getword:@"ratings"]];
}



-(IBAction)showgrapes
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:[words getword:@"grape"]
                                  
                                                            delegate:self
                                  
                                                   cancelButtonTitle:[words getword:@"cancel"]
                                  
                                              destructiveButtonTitle:nil
                                  
                                                   otherButtonTitles:@"葡萄一",@"葡萄二",@"葡萄三",nil];
    
    actionSheet.actionSheetStyle =UIActionSheetStyleAutomatic;
    [actionSheet showInView:self.view];
}


-(IBAction) showwinery
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:[words getword:@"winery"]
                                  
                                                            delegate:self
                                  
                                                   cancelButtonTitle:[words getword:@"cancel"]
                                  
                                              destructiveButtonTitle:nil
                                  
                                                   otherButtonTitles:[words getword:@"winery"],[words getword:@"winemaker"],[words getword:@"wineyard"],[words getword:@"winetourism"],[words getword:@"contact"],nil];
    
    actionSheet.actionSheetStyle =UIActionSheetStyleAutomatic;
    [actionSheet showInView:self.view];
    
}



-(IBAction) showwine
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:[words getword:@"wine"]
                                  
                                                            delegate:self
                                  
                                                   cancelButtonTitle:[words getword:@"cancel"]
                                  
                                              destructiveButtonTitle:nil
                                  
                                                   otherButtonTitles:[words getword:@"thewine"],[words getword:@"winetasting"],[words getword:@"winemaking"],nil];
    
    actionSheet.actionSheetStyle =UIActionSheetStyleAutomatic;
    [actionSheet showInView:self.view];
    
}

/*
UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"排序"
                              
                                                        delegate:self
                              
                                               cancelButtonTitle:@"取消"
                              
                                          destructiveButtonTitle:nil
                              
                                               otherButtonTitles:@"名字排序",@"酒庄排序",@"年份排序",nil];

actionSheet.actionSheetStyle =UIActionSheetStyleAutomatic;

// [actionSheet showInView:[UIApplication sharedApplication].keyWindow];

[actionSheet showInView:self.view];
*/


/*
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    [price resignFirstResponder];
    [personalnote resignFirstResponder];
}

*/
-(void)dismissKeyboard
{
    [price resignFirstResponder];
    [personalnote resignFirstResponder];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)cancel_button:(id)sender
{
    NSLog(@"Helloback");
    [[self presentingViewController] dismissModalViewControllerAnimated:YES];
}


- (void)rateView:(RateView *)rateView ratingDidChange:(float)rating {
    

    NSLog(@"%f",rating);
    int rating_int=rating;
    self.statusLabel.text = [NSString stringWithFormat:@"Rating: %d", rating_int];
    
    [SingletonClass sharedInstance].rating=rating;

    
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailView *nextController = [storyboard instantiateViewControllerWithIdentifier:@"detailview"];
    
    nextController.title=[words getword:@"rating"];
    [self.navigationController pushViewController:nextController animated:YES];
//    nextController.rateView.rating=3;
    //self.rateView.rating;
    //nextController.maintext=@"酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事";
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    //return 2;
    return 1;
}


//- (CGFloat)tableView:(UITableView *)atableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {return 20;}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //if (section==0)
    //  return [self.listData count];
    //return [self.grapeData count];
    return 5;
}



//4
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"WineCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
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
    
    NSArray *arrtitle=[[NSArray alloc] initWithObjects:@"Tasting Notes",@"Wine's Rank",@"Winery",@"Grapes",@"Food Pairing",nil];

    NSString *subtweet = [arrtitle objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:subtweet];
    
    
    //UIImage * bgImage =[UIImage imageNamed:@"wine.jpg"];
    //[cell.imageView setImage:bgImage];
 //   [cell.detailTextLabel setText:subtweet];
    return cell;
    // if (cell==nil)
    // {
    // }
    //[cell.textLabel setText:tweet];
    //[cell.detailTextLabel setText:@"via Codigator"];
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

/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = @"";
            break;
        case 1:
            sectionName = @"葡萄列表";
            break;
    }
    return sectionName;
}
*/
/*
- (void)deselect
{
    [self.tableview deselectRowAtIndexPath:[self.tableview indexPathForSelectedRow] animated:YES];
}
*/

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //该方法响应列表中行的点击事件
    NSLog(@"here");
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





- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
/*
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
*/



-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:@"酒庄故事"]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        WineView *nextController = [storyboard instantiateViewControllerWithIdentifier:@"wineview"];
        
        nextController.title=@"酒庄故事";
        [self.navigationController pushViewController:nextController animated:YES];
        nextController.maintext=@"酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事酒庄故事";
    }
    
    if ([buttonTitle isEqualToString:@"酒的故事"]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        WineView *nextController = [storyboard instantiateViewControllerWithIdentifier:@"wineview"];
        
        nextController.title=@"酒的故事";
        [self.navigationController pushViewController:nextController animated:YES];
        nextController.maintext=@"酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事酒的故事";
        
        
    }
    if ([buttonTitle isEqualToString:@"联系方式"]) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        WineView *nextController = [storyboard instantiateViewControllerWithIdentifier:@"wineview"];
        
        nextController.title=@"联系方式";
        [self.navigationController pushViewController:nextController animated:YES];
        nextController.maintext=@"地址: XXXXXXXXXXXXXXXXXXXXXXXXX\n 电话: 000333333330";
        
        /*
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ProfileView *nextController = [storyboard instantiateViewControllerWithIdentifier:@"profileview"];
        nextController.title=@"帐户信息";
        //nextController.toplabel.text=@"葡萄种类";
        //nextController.mainlabel.text=@"葡萄葡萄葡萄";
        
        [self.navigationController pushViewController:nextController animated:YES];*/
    }
    
}



@end


