//
//  SecondViewController.m
//  Ivin
//
//  Created by user on 2/27/14.
//  Copyright (c) 2014 user. All rights reserved.
//


#import <AVFoundation/AVFoundation.h>

#import "SecondViewController.h"
#import "AcceptWineViewController.h"
#import "ViewController.h"
#import "RootViewController.h"
#import "FormTableController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
  
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)actionsheetshow
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@""
                                  
                                                            delegate:self
                                  
                                                   cancelButtonTitle:@"取消"
                                  
                                              destructiveButtonTitle:nil
                                  
                                                   otherButtonTitles:@"二维码扫描",@"拍照",nil];
    
    actionSheet.actionSheetStyle =UIActionSheetStyleAutomatic;
    
    // [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
    
    [actionSheet showInView:self.view];
}



-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:@"二维码扫描"]) {
//        NSLog(@"Cancel pressed --> 1");
        
     /*
        ViewController *alvc = [self.storyboard instantiateViewControllerWithIdentifier:@"QRcode"];
        [self presentModalViewController:alvc animated:YES];
*/
        RootViewController * rt = [[RootViewController alloc]init];
        [self presentViewController:rt animated:YES completion:^{
            
        }];
    }
    
    if ([buttonTitle isEqualToString:@"拍照"]) {
        //FormTableController* formTable = [[FormTableController alloc ]initWithStyle: UITableViewStyleGrouped];
        
        FormTableController* formTable = [[FormTableController alloc ]  initWithStyle:UITableViewStyleGrouped];
        [self presentModalViewController:formTable animated:YES];
       // NSLog(@"Cancel pressed --> 2");
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)finish_button:(id)sender
{
    NSLog(@"Hello");
    AcceptWineViewController *alvc = [self.storyboard instantiateViewControllerWithIdentifier:@"AcceptWine"];
   // [self presentModalViewController:alvc animated:YES];
    [self presentModalViewController:alvc animated:YES]; //completion:^{// alvc is now on screen; often we do nothing here}];
    
    

}
- (void)viewDidAppear:(BOOL)animated
{
    [self actionsheetshow];
    //NSLog(@"Ihere");
}



@end
