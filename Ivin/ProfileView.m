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
#import "ProfileCell.h"
#import "SingletonClass.h"


@interface ProfileView ()

@end
ProfileCell * profilecell;

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
    self.tableview.backgroundColor=[UIColor blackColor];
    self.view.backgroundColor=[UIColor blackColor];
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
        return 4;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"profilecell";
    ProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil){
        // 这种方式，将会调用cell中的initWithStyle方法
        cell = [[ProfileCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
	//UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // Make cell unselectable
//	cell.selectionStyle = UITableViewCellSelectionStyleNone;
//	cell.backgroundView =  [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"backlist.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
    //cell.backgroundColor=[UIColor blackColor];
    
    
        //	UITextField* tf = nil ;
        switch ( indexPath.row ) {
            case 0: {
                cell.textLabel.text = [words getword:@"signature"];
                break ;
            }
            case 1: {
                cell.textLabel.text = [words getword:@"usertype"];
                break ;
            }
            case 2: {
                cell.textLabel.text = [words getword:@"email"] ;
                break ;
            }
            case 3: {
                cell.textLabel.text = [words getword:@"place"] ;
                break ;
            }
                /*
            case 0: {
                
             //   cell.textLabel.text = @"头像" ;
             //   UIImage * bgImage =[UIImage imageNamed:@"wine.jpg"];
                //[cell.imageView setFrame: CGRectMake(100, 0, 10.0, 10.0)];
                
                //cell.imageView.frame = CGRectMake(1000, 1000, 40,40);
                
             //   [cell.imageView setImage:bgImage];
                //UIImageView *imageView = [[UIImageView alloc] initWithImage:bgImage];
                //cell.accessoryView = imageView;
                
                

                UIImage * bgImage =[UIImage imageNamed:@"profile.png"];
                [cell.imageLable setImage:bgImage];
//                cell.nameLabel.text=@"头像";
                profilecell=cell;
                cell.textLabel.text = @"头像" ;
                break ;
            }*/
        }
	cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"backlist.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
    cell.backgroundColor=[UIColor blackColor];
    cell.textColor=[UIColor whiteColor];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==0)
      return 70;
    return 50;
}


- (void)deselect
{
    [self.tableview deselectRowAtIndexPath:[self.tableview indexPathForSelectedRow] animated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //该方法响应列表中行的点击事件
    //NSLog(@"here");
    
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.5f];
    
    //NSString *heroSelected=[myListArray objectAtIndex:indexPath.row];
    //indexPath.row得到选中的行号，提取出在数组中的内容。
        switch ( indexPath.row ) {
                
            case 0: {
                
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                SignView *vc = [storyboard instantiateViewControllerWithIdentifier:@"signview"];
                [self.navigationController pushViewController:vc animated:YES];
                [self.navigationController setTitle:[words getword:@"signature"]];
                
                UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:[words getword:@"confirm"] style:UIBarButtonItemStylePlain target:vc action:@selector(confirm)];
                vc.navigationItem.rightBarButtonItem = anotherButton;

                
                break;
            }
            case 1: {
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                RadioButtonViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"radioview"];
                [self.navigationController pushViewController:vc animated:YES];
                [self.navigationController setTitle:@"用户类型"];
                UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:[words getword:@"confirm"] style:UIBarButtonItemStylePlain target:vc action:@selector(confirm)];
                vc.navigationItem.rightBarButtonItem = anotherButton;

                
                break;
            }
            case 2: {
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                ProfileEmailView *vc = [storyboard instantiateViewControllerWithIdentifier:@"profileemailview"];
                //[self.navigationController setTitle:@"Email"];
                vc.title=[words getword:@"email"] ;
                
                
                UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:[words getword:@"confirm"] style:UIBarButtonItemStylePlain target:vc action:@selector(confirm)];
                vc.navigationItem.rightBarButtonItem = anotherButton;
                
                
                
                
                [self.navigationController pushViewController:vc animated:YES];
                
                
                break;
            }
            case 3: {
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                ProfileCityView *vc = [storyboard instantiateViewControllerWithIdentifier:@"profilecityview"];
                //[self.navigationController setTitle:@"城市"];
                vc.title=[words getword:@"place"];
                
                UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:[words getword:@"confirm"] style:UIBarButtonItemStylePlain target:vc action:@selector(confirm)];
                vc.navigationItem.rightBarButtonItem = anotherButton;

                [self.navigationController pushViewController:vc animated:YES];
                
                break;
            }
                /*
            case 0: {
                [self actionsheetshow];
                break;
            }*/
                
        
    }
}





- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
        return 20;
}

- (void)confirm {
    //NSLog(@"confirm");
    [self.navigationController popViewControllerAnimated:YES];
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


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    //self.imageView.image = chosenImage;
    //[profilecell.imageView setImage: chosenImage];
    [profilecell.imageLable setImage:chosenImage];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
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


@end
