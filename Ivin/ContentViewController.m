//
//  ContentViewController.m
//  Ivin
//
//  Created by user on 6/16/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "ContentViewController.h"
#import "SingletonClass.h"

@interface ContentViewController ()

@end

@implementation ContentViewController

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
    _content.numberOfLines = 3;
    
    self.view.backgroundColor=[UIColor clearColor];
    
    self.content1.backgroundColor=[UIColor blackColor];
    
    
    
    if ([_contenttype isEqual:@"winery"])
    {
        _content1.text=[SingletonClass sharedInstance].winery.Description;
        
    }
    else if ([_contenttype isEqual:@"winemaker"])
    {
        _content1.text=[SingletonClass sharedInstance].winery.OtherHistoryTitle;
        
    }
    else if ([_contenttype isEqual:@"wineyard"])
    {
        _content1.text=[SingletonClass sharedInstance].winery.VinePresentation;
        
    }
    else if ([_contenttype isEqual:@"winetourism"])
    {
        _content1.text=[SingletonClass sharedInstance].winery.Winetours;
        
    }
    else if ([_contenttype isEqual:@"contact"])
    {
        _content1.text=[SingletonClass sharedInstance].winery.Contact;
        
    }
    else if ([_contenttype isEqual:@"thewine"])
    {
        _content1.text=[SingletonClass sharedInstance].wine.Wine;
        
    }
    else if ([_contenttype isEqual:@"winetasting"])
    {
        _content1.text=[SingletonClass sharedInstance].wine.Tasting;
        
    }
    else if ([_contenttype isEqual:@"winemaking"])
    {
        _content1.text=[SingletonClass sharedInstance].wine.Making;
        
    }
    else if ([_contenttype isEqual:@"advice"])
    {
        _content1.text=[SingletonClass sharedInstance].wine.WineryRecommandation;
        
    }

    
    [_content1 setUserInteractionEnabled:TRUE];
    //@"adsfafsd fdqsdfs  fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsd  fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq q";
    
   // [_content sizeToFit];
   // _content.text=@"adsfafsd fdqsdfs  fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsd  fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq fdqsdfsq q";
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
