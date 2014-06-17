//
//  GrapeViewController.m
//  Ivin
//
//  Created by user on 6/16/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "GrapeViewController.h"

@interface GrapeViewController ()

@end

@implementation GrapeViewController

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
    
    self.tableview.delegate=self;
    self.tableview.dataSource=self;

	// Do any additional setup after loading the view.
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

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    switch ( indexPath.row ) {
        case 0: {
            cell.textLabel.text = @"第一种葡萄" ;
            break ;
        }
        case 1: {
            cell.textLabel.text =@"第二种葡萄";
            break ;
        }
        case 2: {
            cell.textLabel.text = @"第三种葡萄" ;
            break ;
        }
    }
    return cell;
}


@end
