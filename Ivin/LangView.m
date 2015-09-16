//
//  LangView.m
//  Ivin
//
//  Created by user on 4/6/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "LangView.h"
#import "SingletonClass.h"
#import "words.h"

@interface LangView ()

@end

@implementation LangView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)confirm
{
    
    myAlertView = [[UIAlertView alloc]initWithTitle:[words getword:@"info"] message:[words getword:@"restartinfo"] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [myAlertView show];
    [self.navigationController popViewControllerAnimated:YES];
    
    NSString* l;
    if (lang==0)
    {
        l=@"fr";
        [SingletonClass sharedInstance].lang=@"fr";
    }
    else if(lang==1)
    {
        l=@"zh";
        [SingletonClass sharedInstance].lang=@"zh";
    }
    else{
        l=@"en";
        [SingletonClass sharedInstance].lang=@"en";
    }
    
//    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"try" ofType:@"plist"];
    
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath = [paths objectAtIndex:0];
    //得到完整的文件名
    NSString *filename=[plistPath stringByAppendingPathComponent:@"Info.plist"];
    
    NSMutableDictionary* dic =[[NSMutableDictionary alloc] initWithContentsOfFile:filename];
    [dic setObject:l forKey: @"lang"];
    [dic writeToFile:filename atomically:YES];
   // NSLog(@"%lu",(unsigned long)[dic count]);

}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];

    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:[words getword:@"confirm"] style:UIBarButtonItemStylePlain target:self action:@selector(confirm)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    
    
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    NSString* l=[SingletonClass sharedInstance].lang;
    
   // NSLog(@"%@",l);
    
    if ([l isEqual:@"fr"])
    {
        lang=0;
    }
    else if ([l isEqual:@"zh"]){
        lang=1;
    }
    else
    {
        lang=2;
    }
	// Do any additional setup after loading the view.
    
    self.tableview.backgroundColor=[UIColor clearColor];
    self.view.backgroundColor=[UIColor clearColor];
    [self.tableview setSeparatorColor:[UIColor clearColor]];

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
    return 3;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    //current=indexPath.row;
    if (indexPath.row==0)
    {
        //[SingletonClass sharedInstance].lang=@"fr";
        lang=0;
        //[words changelang:@"fr"];
        
    }
    else if (indexPath.row==1)
    {
        lang=1;
        //[SingletonClass sharedInstance].lang=@"zh";
        //[words changelang:@"zh"];
    }
    else
    {
        lang=2;
        //[SingletonClass sharedInstance].lang=@"en";
        //[words changelang:@"en"];
        
    }
    [self.tableview reloadData];
}





// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    

    
    cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"backlist.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
    cell.backgroundColor=[UIColor clearColor];
    cell.textColor=[UIColor whiteColor];
    
    
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // Make cell unselectable
	cell.selectionStyle = UITableViewCellSelectionStyleBlue;
	
    
        switch ( indexPath.row ) {
            case 0: {
                cell.textLabel.text = @"Français" ;
                break ;
            }
            case 1: {
                cell.textLabel.text =@"中文"; // [words getword:@"website"]; //@"访问网页版" ;
                break ;
            }
            case 2: {
                cell.textLabel.text = @"English" ;
                break ;
            }
                
     //       if (true)//(lang==indexPath.row)
     //       {
     //           cell.accessoryType=UITableViewCellAccessoryCheckmark;
     //       }
        }
    return cell;
}




- (UITableViewCellAccessoryType)tableView:(UITableView*)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath*)indexPath
{
    int current=indexPath.row;
    if(current==lang)
    {
        return UITableViewCellAccessoryCheckmark;
    }
   else
    {
        return UITableViewCellAccessoryNone;
    }
}


@end
