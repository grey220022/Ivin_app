//
//  ProfileView.m
//  Ivin
//
//  Created by user on 3/17/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "ProfileView.h"
#import "SignView.h"
#import "RadioButtonViewController.h"
#import "ProfileEmailView.h"
#import "ProfileCityView.h"
#import "words.h"


@interface ProfileView ()

@end

@implementation ProfileView

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
	// Do any additional setup after loading the view.
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];

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
        return 4;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // Make cell unselectable
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
    
        //	UITextField* tf = nil ;
        switch ( indexPath.row ) {
            case 0: {
                cell.textLabel.text = @"用户签名" ;
                break ;
            }
            case 1: {
                cell.textLabel.text = @"用户类别" ;
                break ;
            }
            case 2: {
                cell.textLabel.text = @"Email" ;
                break ;
            }
            case 3: {
                cell.textLabel.text = @"城市" ;
                break ;
            }
                /*
            case 4: {
                cell.textLabel.text = @"城市" ;
                break ;
 
            }*/
        }
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //该方法响应列表中行的点击事件
    NSLog(@"here");
    //[self performSelector:@selector(deselect) withObject:nil afterDelay:0.5f];
    
    //NSString *heroSelected=[myListArray objectAtIndex:indexPath.row];
    //indexPath.row得到选中的行号，提取出在数组中的内容。
        switch ( indexPath.row ) {
                
            case 0: {
                
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                SignView *vc = [storyboard instantiateViewControllerWithIdentifier:@"signview"];
                [self.navigationController pushViewController:vc animated:YES];
                [self.navigationController setTitle:@"个性签名"];
                
                UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:[words getword:@"confirm"] style:UIBarButtonItemStylePlain target:self action:@selector(confirm)];
                vc.navigationItem.rightBarButtonItem = anotherButton;

                
                break;
            }
            case 1: {
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                RadioButtonViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"radioview"];
                [self.navigationController pushViewController:vc animated:YES];
                [self.navigationController setTitle:@"用户类型"];
                UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:[words getword:@"confirm"] style:UIBarButtonItemStylePlain target:self action:@selector(confirm)];
                vc.navigationItem.rightBarButtonItem = anotherButton;

                
                break;
            }
            case 2: {
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                ProfileEmailView *vc = [storyboard instantiateViewControllerWithIdentifier:@"profileemailview"];
                //[self.navigationController setTitle:@"Email"];
                vc.title=@"Email";
                
                
                UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:[words getword:@"confirm"] style:UIBarButtonItemStylePlain target:self action:@selector(confirm)];
                vc.navigationItem.rightBarButtonItem = anotherButton;
                
                
                
                
                [self.navigationController pushViewController:vc animated:YES];
                
                
                break;
            }
            case 3: {
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                ProfileCityView *vc = [storyboard instantiateViewControllerWithIdentifier:@"profilecityview"];
                //[self.navigationController setTitle:@"城市"];
                vc.title=@"城市";
                
                UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:[words getword:@"confirm"] style:UIBarButtonItemStylePlain target:self action:@selector(confirm)];
                vc.navigationItem.rightBarButtonItem = anotherButton;

                [self.navigationController pushViewController:vc animated:YES];
                
                break;
            }
                /*
            case 4: {
                break;
            }
                */
        
    }
}





- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (void)confirm {
    NSLog(@"confirm");
    [self.navigationController popViewControllerAnimated:YES];
}



@end
