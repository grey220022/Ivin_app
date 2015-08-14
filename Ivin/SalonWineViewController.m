//
//  ContentViewController.m
//  Ivin
//
//  Created by user on 6/16/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "SalonWineViewController.h"
#import "SingletonClass.h"
#import "UIImage+Network.h"
#import "words.h"
#import "AllWineListViewController.h"
#import "IvinHelp.h"
#import "UIImage+Network.h"
#import "UIImage+Network.h"
#import "WineryViewCell.h"
#import "SalonViewController.h"
#import "ContentViewController.h"

@interface SalonWineViewController ()

@end





@implementation SalonWineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[[self navigationController] setNavigationBarHidden:NO animated:NO];

    _classarray = [[NSMutableArray alloc] init];
    _idarray=[[NSMutableArray alloc] init];
    _imagearray=[[NSMutableArray alloc] init];

    NSString* l=[SingletonClass sharedInstance].lang;
    if ((![l isEqual:@"en"])&& (![l isEqual:@"zh"]))
        l=@"fr";
    
    
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
                  e=[[SingletonClass sharedInstance].WineryImageUrl objectAtIndex:i];
                  [_imagearray addObject: e  ];
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
    {
      self.navigationItem.title=[words getword:@"h1"];
      
        
        
      [_sw setScrollEnabled:YES];
      [_sw setContentSize:CGSizeMake(320, 720)];

      
      UIImageView *salonimage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brick-1.png"]];
      salonimage.frame = CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height/2-80);
      [_sw addSubview:salonimage];
      
        
      UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
      [button addTarget:self action:@selector(descriptionclick:) forControlEvents:UIControlEventTouchUpInside];
      [button setTitle:[words getword:@"salondescription"] forState:UIControlStateNormal];
      
      CGRect frame=CGRectMake(0, [UIScreen mainScreen].applicationFrame.size.height/2-50, [UIScreen mainScreen].applicationFrame.size.width, 40.0);
        
        
      UILabel *descriptionlabel = [[UILabel alloc]initWithFrame:frame];
      descriptionlabel.text = @">\t";
      descriptionlabel.font=[UIFont boldSystemFontOfSize:23];
      descriptionlabel.backgroundColor = [UIColor clearColor];
      descriptionlabel.textColor = [UIColor whiteColor];
      descriptionlabel.textAlignment = NSTextAlignmentRight;
      
      button.frame =frame;
      button.backgroundColor=[UIColor grayColor];
      button.titleLabel.font = [UIFont boldSystemFontOfSize:19];

      UILabel *searchlabel = [[UILabel alloc]initWithFrame:CGRectMake(20, [UIScreen mainScreen].applicationFrame.size.height/2+10, [UIScreen mainScreen].applicationFrame.size.width, 40.0)];
      //searchlabel.text=[words getword:@"search"];
        
      searchlabel.textColor = [UIColor whiteColor];
      searchlabel.textAlignment = NSTextAlignmentLeft;
      [_sw addSubview:button];
      [_sw addSubview:descriptionlabel];
      [_sw addSubview:searchlabel];
        
      
      /*
      UILabel *expoLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].applicationFrame.size.height/2-80, [UIScreen mainScreen].applicationFrame.size.width, 450)];
      expoLabel.text=expotext;
      expoLabel.lineBreakMode = NSLineBreakByWordWrapping;
      expoLabel.numberOfLines = 0;
      expoLabel.textColor = [UIColor grayColor];
      [_sw addSubview:expoLabel];
      */
      
      salonimage.contentMode=UIViewContentModeScaleAspectFit;
      [salonimage loadImageFromURL: [NSURL URLWithString:  expoimage] placeholderImage:nil cachingKey:expoimage];
      self.tableview.frame = CGRectMake(0, [UIScreen mainScreen].applicationFrame.size.height/2+30, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height/2+10);
    }
    _activityIndicator = [[UIActivityIndicatorView alloc]
                          initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    [_activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:_activityIndicator];
    _activityIndicator.center=CGPointMake(160, 250);
    _activityIndicator.hidesWhenStopped = YES;

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

-(void)descriptionclick:(UIButton*)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ContentViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"contentview"];
    [self.navigationController pushViewController:nextController animated:YES];
    nextController.contenttype=@"w1";
    nextController.imageurl=expoimage;
    nextController.title=[words getword:@"h1"];
    //nextController.imageurl=@"NOIMG";
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
    
    
    if (self.filterlevel!=1)
    {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.textLabel.text = [_classarray objectAtIndex:indexPath.row];

        cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"backlist.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
        cell.backgroundColor=[UIColor blackColor];
        cell.textColor=[UIColor whiteColor];
        return cell;
    }
    
    else
    {
        WineryViewCell *cell = [[WineryViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        cell.nameLabel.text = [_classarray objectAtIndex:indexPath.row];
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"newline.png"] ];
        cell.imageView.frame = CGRectMake(0,0,32,32);
        [cell.imageLable loadImageFromURL:[NSURL URLWithString:[_imagearray objectAtIndex:indexPath.row]] placeholderImage:nil cachingKey:[_imagearray objectAtIndex:indexPath.row]];
        cell.backgroundColor=[UIColor blackColor];
        cell.textColor=[UIColor whiteColor];
        return cell;
    }
}


- (void)deselect
{
    [self.tableview deselectRowAtIndexPath:[self.tableview indexPathForSelectedRow] animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.filterlevel==1)
        return 115;
    return 50;
}


/*

-(void)loaddata
{
    NSString* l=[SingletonClass sharedInstance].lang;
    if ((![l isEqual:@"en"])&& (![l isEqual:@"zh"]))
        l=@"fr";
    
    NSString *winelisturl= [NSString stringWithFormat:@"%@%@%@%@",@"http://www.ivintag.com/api/Wine/AllWineForWinery?wineryid=",[SingletonClass sharedInstance].filterwineryname,@"&lang=",l];
    
    
    
    NSData* winelistdata=[IvinHelp geturlcontentfromcache:winelisturl];
    
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
    
}
*/
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];

    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.0f];

  //  if (self.filterlevel<2)
    {
        
        if (self.filterlevel==0)
        {
          UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
          SalonWineViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"salonwinefilter"];
          nextController.filterlevel=self.filterlevel+1;
          [SingletonClass sharedInstance].filterregion=[_classarray objectAtIndex:indexPath.row];
          nextController.title=[_classarray objectAtIndex:indexPath.row];
          [self.navigationController pushViewController:nextController animated:YES];
        }
        else if (self.filterlevel==1)
        {
          [SingletonClass sharedInstance].searchmode=NO;
          [SingletonClass sharedInstance].filterwineryname=[_classarray objectAtIndex:indexPath.row];
          UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
          AllWineListViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"AllWine"];
          nextController.title=[_classarray objectAtIndex:indexPath.row];
  //        [self loaddata];
          [self.navigationController pushViewController:nextController animated:YES];
        }
    }
    /*
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




- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [_activityIndicator stopAnimating];
}


- (void) threadStartAnimating:(id)data {
    [_activityIndicator startAnimating];
}



@end
