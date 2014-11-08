//
//  FirstViewController.m
//  Ivin
//
//  Created by user on 2/27/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "FirstViewController.h"
#import "FormTableController.h"
#import "SendViewController.h"
#import "ProfileView.h"
#import "words.h"
#import "LangView.h"
#import "NewloginView.h"
#import "SingletonClass.h"


@interface FirstViewController ()

@end

UITableViewCell * profilecell;
UITableViewCell *logincell;

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.title=[words getword:@"setting"];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];

}


-(void)viewWillAppear:(BOOL)animated
{
    if (logincell== nil)
        return;
    if ([SingletonClass sharedInstance].username == nil)
    {
        logincell.textLabel.text =  [words getword:@"userlogin"]; //@"用户帐号" ;
    }
    else
    {
        logincell.textLabel.text =  [words getword:@"signout"]; //@"用户帐号" ;
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section==0)
    {
      return 6;
    }
    return 2;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // Make cell unselectable
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
    
    if (indexPath.section==0)
    {
//	UITextField* tf = nil ;
	switch ( indexPath.row ) {
		case 0: {
            
            if ([SingletonClass sharedInstance].username == nil)
            {
                cell.textLabel.text =  [words getword:@"userlogin"]; //@"用户帐号" ;
            }
            else
            {
                cell.textLabel.text =  [words getword:@"signout"]; //@"用户帐号" ;
            }
            logincell=cell;
			break ;
		}
		case 1: {
			cell.textLabel.text =  [words getword:@"website"]; //@"访问网页版" ;
			break ;
		}
            
            
		case 2: {
			cell.textLabel.text = [words getword:@"feedback"];//@"feedback" ;
			break ;
		}
		case 3: {
			cell.textLabel.text = [words getword:@"storerating"];//@"storerating";
			break ;
		}
		case 4: {
			cell.textLabel.text = [words getword:@"about"];//@"about" ;
			break ;
		}
		case 5: {
			cell.textLabel.text = [words getword:@"lang"];//@"about" ;
			break ;
		}
            
	}
    }
    else{
        switch ( indexPath.row ) {
            case 0: {
                cell.textLabel.text = [words getword:@"photo"];//@"修改头像" ;
                
                
                UIImage * bgImage =[UIImage imageNamed:@"wine.jpg"];
                
                
                //[cell.imageView setFrame: CGRectMake(100, 100, 10.0, 40.0)];
                
                [cell.imageView setImage:bgImage];
                
                profilecell=cell;
//                CGRectMake(-30.0, 20, 160.0, 40.0);
                
                break ;
            }
            case 1: {
                cell.textLabel.text = [words getword:@"profile"];//@"我的资料" ;
                break ;
            }
        }
        
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
    if (indexPath.section==0)
    {
    switch ( indexPath.row ) {

     case 0: {
         
//         FormTableController* formTable = [[FormTableController alloc ]  initWithStyle:UITableViewStyleGrouped];
//         [self presentModalViewController:formTable animated:NO];

         UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
         NewloginView *newloginview = [storyboard instantiateViewControllerWithIdentifier:@"newloginview"];
         
         [self presentModalViewController:newloginview animated:YES];
         
         
         break;
    }
        case 1: {
            break;
        }
        case 2: {
            
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SendViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"sendview"];
        [self presentModalViewController:vc animated:NO];
            
            
            break;
        }
        case 3: {
            break;
        }
        case 4: {
            UIAlertView *myAlertView;
            myAlertView = [[UIAlertView alloc]initWithTitle:@"制作团队" message:@"巴黎酒社，曾，王，郑团队" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [myAlertView show];
            break;
        }
        case 5: {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            LangView *nextController = [storyboard instantiateViewControllerWithIdentifier:@"langview"];
            nextController.title=[words getword:@"lang"];
            [self.navigationController pushViewController:nextController animated:YES];
            break;
        }
            
    }
    }
    else {
        switch ( indexPath.row ) {
                
            case 0: {
                
                [self actionsheetshow];
                break;
            }
            case 1: {
                
                if ([SingletonClass sharedInstance].username!=nil)
                {
                    [SingletonClass sharedInstance].username=nil;
                    UIAlertView *myAlertView;
                    myAlertView = [[UIAlertView alloc]initWithTitle:[words getword:@"signout"] message:[words getword:@"signoutok"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
                    [myAlertView show];
                    break;
                }
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                ProfileView *nextController = [storyboard instantiateViewControllerWithIdentifier:@"profileview"];
                nextController.title=@"帐户信息";
                [self.navigationController pushViewController:nextController animated:YES];
                break;
            }
        }
    }
}





- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}



-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:@"拍照"]) {
        
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                  message:@"Device has no camera"
                                                                 delegate:nil
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles: nil];
            
            [myAlertView show];
            return;
        }

        
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:NULL];

        
        
        
        
    }
    
    
    if ([buttonTitle isEqualToString:@"从相簿中获取"]) {
        
     
        
        
        
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:NULL];

        
        
        
        
        
    }
}

-(void)actionsheetshow
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@""
                                  
                                                            delegate:self
                                  
                                                   cancelButtonTitle:@"取消"
                                  
                                              destructiveButtonTitle:nil
                                  
                                                   otherButtonTitles:@"拍照",@"从相簿中获取",nil];
    
    actionSheet.actionSheetStyle =UIActionSheetStyleAutomatic;
    [actionSheet showInView:self.view];
}








#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    //self.imageView.image = chosenImage;
    [profilecell.imageView setImage: chosenImage];

    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}





@end
