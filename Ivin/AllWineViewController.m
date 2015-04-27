//
//  ContentViewController.m
//  Ivin
//
//  Created by user on 6/16/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "AllWineViewController.h"
#import "SingletonClass.h"
#import "UIImage+Network.h"
#import "words.h"
#import "AllWineListViewController.h"
#import "IvinHelp.h"

@interface AllWineViewController ()

@end





@implementation AllWineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    NSLog(@"%d",self.filterlevel);
    //if ([SingletonClass sharedInstance].filterlevel==1)
    if (self.filterlevel==0)
    {
    NSString * allwinesurl=@"http://www.ivintag.com/api/EndUserWine/WineList?enduserid=2";
    
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
        tmp=[wine valueForKey:@"CreateDate"];
        [[SingletonClass sharedInstance].CreateDate addObject:tmp];
        
        tmp=[wine valueForKey:@"WineId"];
        [[SingletonClass sharedInstance].WineId addObject:tmp];
        
        tmp=[wine valueForKey:@"Like"];
        if ((tmp == nil) || ([tmp isKindOfClass:[NSNull class]]) || (![tmp boolValue]))
            tmp=@"false";
        else tmp=@"true";
        [[SingletonClass sharedInstance].Likewine addObject:tmp];
        tmp=[wine valueForKey:@"RegionName"];
        [[SingletonClass sharedInstance].RegionName addObject:tmp];
        tmp=[wine valueForKey:@"WineTypeName"];
        [[SingletonClass sharedInstance].WineTypeName addObject:tmp];
    }
    }
    
    
    
    
    
    
    
    
    //mode=1;
    //[self changetable];
    
//    if ([SingletonClass sharedInstance].filterlevel==1)
    if (self.filterlevel==0)
    {
    //_classarray=[[NSMutableArray alloc] initWithObjects:@"Pairs",@"Lyon",@"Bordeaux",@"Bourgogne",@"Auvergne",@"Bretagne",nil];

        _classarray = [[NSMutableArray alloc] init];
        for(id e in [SingletonClass sharedInstance].RegionName)
        {
            if(![_classarray containsObject:e])
            {
                [_classarray addObject:e];
            }
        }
    }
    else if (self.filterlevel==1)
    {
        _classarray = [[NSMutableArray alloc] init];
        NSString* filterregion=[SingletonClass sharedInstance].filterregion;
        for (int i=0; i<[SingletonClass sharedInstance].RegionName.count; i++)
        {
            NSString* left= [[SingletonClass sharedInstance].RegionName objectAtIndex:i];
            if ([left isEqualToString:filterregion])
            {
                NSString* e=[[SingletonClass sharedInstance].WineryName objectAtIndex:i];
                if(![_classarray containsObject:e])
                {
                  [_classarray addObject: e  ];
                }
            }
        }
    }

    
    else if (self.filterlevel==2)
    {
        _classarray = [[NSMutableArray alloc] init];
        NSString* filterregion=[SingletonClass sharedInstance].filterregion;
        NSString* filterwineryname=[SingletonClass sharedInstance].filterwineryname;
        for (int i=0; i<[SingletonClass sharedInstance].RegionName.count; i++)
        {
            NSString* left= [[SingletonClass sharedInstance].RegionName objectAtIndex:i];
            NSString* left1= [[SingletonClass sharedInstance].WineryName objectAtIndex:i];
            if (([left isEqualToString:filterregion]) && ([left1 isEqualToString:filterwineryname]))
            {
                NSString* e=[[SingletonClass sharedInstance].WineTypeName objectAtIndex:i];
                if(![_classarray containsObject:e])
                {
                    [_classarray addObject: e  ];
                }
            }
        }
    }

    /*
    else if (self.filterlevel==3)
    {
        _classarray = [[NSMutableArray alloc] init];
        NSString* filterregion=[SingletonClass sharedInstance].filterregion;
        NSString* filtertype=[SingletonClass sharedInstance].filtertype;
//        NSString* filterappellation=[SingletonClass sharedInstance].filterappellation;

        for (int i=0; i<[SingletonClass sharedInstance].RegionName.count; i++)
        {
            NSString* left= [[SingletonClass sharedInstance].RegionName objectAtIndex:i];
            NSString* left1= [[SingletonClass sharedInstance].WineTypeName objectAtIndex:i];
            NSString* left2= [[SingletonClass sharedInstance].Appellation objectAtIndex:i];
            
            if (([left isEqualToString:filterregion]) && ([left1 isEqualToString:filtertype])&&([left2 isEqualToString:filterappellation]))
            {
                NSString* e=[[SingletonClass sharedInstance].WineryName objectAtIndex:i];
                if(![_classarray containsObject:e])
                {
                    [_classarray addObject: e  ];
                }
            }
        }
    }*/
    
    
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.tableview.backgroundColor=[UIColor blackColor];
    self.view.backgroundColor=[UIColor blackColor];
    [self.tableview setSeparatorColor:[UIColor clearColor]];

    /*
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"noirnew.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(oov)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
     */
    if (self.filterlevel==0)
      self.navigationItem.title=[words getword:@"search"];
    
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


/*
-(void)oov
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:[words getword:@"sort"]
                                                            delegate:self                                  
                                                   cancelButtonTitle:[words getword:@"cancel"]
                                              destructiveButtonTitle:nil
                                                   otherButtonTitles:@"地区",@"产区",@"年份",nil];
    actionSheet.actionSheetStyle =UIActionSheetStyleAutomatic;
    [actionSheet showInView:self.view];
}*/

/*

- (void)changetable {
    if (mode==1)
    {
        _classarray=[[NSMutableArray alloc] initWithObjects:@"Pairs",@"Lyon",@"Bordeaux",@"Bourgogne",@"Auvergne",@"Bretagne",nil];
    }
    else if (mode==2)
    {
        _classarray=[[NSMutableArray alloc] initWithObjects:@"AOC1",@"AOC2",@"AOC3",@"AOC4",@"AOC5",@"AOC6",nil];
    }
    else if (mode==3)
    {
        _classarray=[[NSMutableArray alloc] initWithObjects:@"2014",@"2013",@"2012",@"2011",@"2010",@"2009",nil];
    }
    else {
        _classarray=[[NSMutableArray alloc] initWithObjects:@"Pairs",@"Lyon",@"Bordeaux",@"Bourgogne",@"Auvergne",@"Bretagne",nil];
    }
}

*/


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_classarray count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.textLabel.text = [_classarray objectAtIndex:indexPath.row];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"backlist.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
    cell.backgroundColor=[UIColor blackColor];
    cell.textColor=[UIColor whiteColor];
    return cell;
}


- (void)deselect
{
    [self.tableview deselectRowAtIndexPath:[self.tableview indexPathForSelectedRow] animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}






-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.0f];

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
