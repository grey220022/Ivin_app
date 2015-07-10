//
//  ContentViewController.m
//  Ivin
//
//  Created by user on 6/16/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "SalonViewController.h"
#import "SingletonClass.h"
#import "UIImage+Network.h"
#import "words.h"
#import "AllWineListViewController.h"
#import "IvinHelp.h"
#import "SalonViewCell.h"
#import "SalonWineViewController.h"

@interface SalonViewController ()

@end


NSString* expoid;


@implementation SalonViewController


-(void)loaddata
{
    _classarray = [[NSMutableArray alloc] init];
    _datearray=[[NSMutableArray alloc] init];
    _imagearray = [[NSMutableArray alloc] init];
    _idarray=[[NSMutableArray alloc] init];
    
    NSString* l=[SingletonClass sharedInstance].lang;
    if ((![l isEqual:@"en"])&& (![l isEqual:@"zh"]))
        l=@"fr";
    NSString * allwinesurl=[NSString stringWithFormat:@"%@%@",@"http://www.ivintag.com/api/Expo/ExpoList?lang=",l];
    
    NSData* winelistdata=[IvinHelp geturlcontentfromcache:allwinesurl];
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
    NSString * tmp2;
    
    for (NSDictionary *wine in winelist) {
        tmp=[wine valueForKey:@"Name"];
        [_classarray addObject:tmp];
        tmp=[wine valueForKey:@"Id"];
        [_idarray addObject:tmp];
        tmp=[wine valueForKey:@"PresentationPictureUrl"];
        [_imagearray addObject:tmp];
        tmp=[wine valueForKey:@"StartDate"];
        tmp2=[wine valueForKey:@"EndDate"];
        [_datearray addObject:[NSString stringWithFormat:@"%@%@%@",tmp,@" - ",tmp2]];
    }
}



-(void)loadwinedata
{
    NSString* l=[SingletonClass sharedInstance].lang;
    if ((![l isEqual:@"en"])&& (![l isEqual:@"zh"]))
        l=@"fr";
    [[SingletonClass sharedInstance] resetdate];

    NSData* winelistdata=[IvinHelp geturlcontentfromcache:[NSString stringWithFormat:@"http://www.ivintag.com/api/ExpoWine/WineList?expoid=%@&lang=%@",expoid,l]];
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
        
        tmp=[wine valueForKey:@"WineId"];
        [[SingletonClass sharedInstance].WineId addObject:tmp];
        
        [[SingletonClass sharedInstance].Likewine addObject:tmp];
        tmp=[wine valueForKey:@"RegionName"];
        [[SingletonClass sharedInstance].RegionName addObject:tmp];
        tmp=[wine valueForKey:@"WineTypeName"];
        [[SingletonClass sharedInstance].WineTypeName addObject:tmp];
        
        tmp=[wine valueForKey:@"WineryImageUrl"];
        [[SingletonClass sharedInstance].WineryImageUrl addObject:tmp];
    
    }
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self loaddata];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    [self.tableview setSeparatorColor:[UIColor colorWithWhite:1.0 alpha:0.0]];
    self.tableview.backgroundColor=[UIColor blackColor];
    self.view.backgroundColor=[UIColor blackColor];
    self.navigationItem.title=[words getword:@"h1"];
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_classarray count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SalonViewCell *cell = [[SalonViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.nameLabel.text = [_classarray objectAtIndex:indexPath.row];
    cell.subnameLabel.text = [_datearray objectAtIndex:indexPath.row];
    [cell.imageLable loadImageFromURL:[NSURL URLWithString:[_imagearray objectAtIndex:indexPath.row]] placeholderImage:nil cachingKey:[_imagearray objectAtIndex:indexPath.row]];

//    cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"backlist.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
    cell.backgroundColor=[UIColor blackColor];
    cell.textColor=[UIColor whiteColor];
    return cell;
}


- (void)deselect
{
    [self.tableview deselectRowAtIndexPath:[self.tableview indexPathForSelectedRow] animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}






-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.0f];
    expoid=[_idarray objectAtIndex:indexPath.row];
    [self loadwinedata];

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SalonWineViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"salonwinefilter"];
    nextController.filterlevel=0;
//    nextController.title=[_classarray objectAtIndex:indexPath.row];

    [self.navigationController pushViewController:nextController animated:YES];
    /*
    if (self.filterlevel<2)
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        AllWineViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"winefilter"];
        nextController.filterlevel=self.filterlevel+1;
        if (self.filterlevel==0)
            [SingletonClass sharedInstance].filterregion=[_classarray objectAtIndex:indexPath.row];
        else if (self.filterlevel==1)
            [SingletonClass sharedInstance].filterwineryname=[_classarray objectAtIndex:indexPath.row];
        //else if (self.filterlevel==2)
        //  [SingletonClass sharedInstance].filterappellation=[_classarray objectAtIndex:indexPath.row];
        nextController.title=[_classarray objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:nextController animated:YES];
    }
    else{
        [SingletonClass sharedInstance].filtertype=[_classarray objectAtIndex:indexPath.row];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        AllWineListViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"AllWine"];
        //        nextController.title=[_classarray objectAtIndex:indexPath.row];
        nextController.title=[_classarray objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:nextController animated:YES];
    }
    */
    /*
     UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
     AllWineListViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"AllWine"];
     nextController.title=[_classarray objectAtIndex:indexPath.row];
     [self.navigationController pushViewController:nextController animated:YES];
     */
}




/*
 
 -(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
 NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
 
 if ([buttonTitle isEqualToString:@"地区"]) {
 NSLog(@"Cancel pressed --> 1");
 mode=1;
 [self changetable];
 [_tableview reloadData];
 }
 if ([buttonTitle isEqualToString:@"产区"]) {
 NSLog(@"Cancel pressed --> 2");
 mode=2;
 [self changetable];
 [_tableview reloadData];
 }
 if ([buttonTitle isEqualToString:@"年份"]) {
 NSLog(@"Cancel pressed --> 3");
 mode=3;
 [self changetable];
 [_tableview reloadData];
 }
 }
 */









@end
