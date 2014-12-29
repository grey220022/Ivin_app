//
//  FormTableController.m
//  TableWithTextField
//
//  Created by Andrew Lim on 4/15/11.
#import "RegisterFormTableController.h"
#import "words.h"


@implementation RegisterFormTableController
@synthesize name = name_ ;
@synthesize address = address_ ;
@synthesize password = password_ ;
@synthesize description = description_ ;

#pragma mark -
#pragma mark Initialization

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
	
	self.name        = @"" ;
	self.address     = @"" ;
	self.password    = @"" ;
	self.description = @"" ;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  // Return the number of sections.
  return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  // Return the number of rows in the section.
  return 4;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView 
				 cellForRowAtIndexPath:(NSIndexPath *)indexPath {  
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

    // Make cell unselectable
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
	UITextField* tf = nil ;	
	switch ( indexPath.row ) {
		case 0: {
			cell.textLabel.text = @"Name" ;
			tf = nameField_ = [self makeTextField:self.name placeholder:@"John Appleseed"];
			[cell addSubview:nameField_];
			break ;
		}
		case 1: {
			cell.textLabel.text = @"Password" ;
            
			tf = addressField_ = [self makeTextField:self.address placeholder:@"password"];
            tf.secureTextEntry=YES;
            addressField_.secureTextEntry=YES;
			[cell addSubview:addressField_];
			break ;
		}
         
		case 2: {
			cell.textLabel.text = @"Name" ;
			tf = passwordField_ = [self makeTextField:self.password placeholder:@"Name"];
			[cell addSubview:passwordField_];
			break ;
		}	
		case 3: {
			cell.textLabel.text = @"Email" ;
			tf = descriptionField_ = [self makeTextField:self.description placeholder:@"My Gmail Account"];
			[cell addSubview:descriptionField_];
			break ;
		}
          
            
	}

	// Textfield dimensions
	tf.frame = CGRectMake(120, 12, 170, 30);
	
	// Workaround to dismiss keyboard when Done/Return is tapped
	[tf addTarget:self action:@selector(textFieldFinished:) forControlEvents:UIControlEventEditingDidEndOnExit];	
	
	// We want to handle textFieldDidEndEditing
	tf.delegate = self ;
    
  return cell;
}

#pragma mark -
#pragma mark Table view delegate

#pragma mark -
#pragma mark Memory management


/*
- (void)createbtnpress{
    NSLog(@"rcreate");
}
*/


- (void)cancelbtnpress{
    //NSLog(@"rcancel");
     [self dismissViewControllerAnimated:YES completion:nil];
//[self dismissViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:NO];
}


- (void)confirmbtnpress{
    //NSLog(@"rconfirm");
    //[self dismissViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
   // [UIButton buttonWithType:UIButtonTypeSystem];
}
/*
- (void)dealloc {
    [super dealloc];
}
*/
-(UITextField*) makeTextField: (NSString*)text	
                  placeholder: (NSString*)placeholder  {
	UITextField *tf = [[UITextField alloc] init];
	tf.placeholder = placeholder ;
	tf.text = text ;         
	tf.autocorrectionType = UITextAutocorrectionTypeNo ;
	tf.autocapitalizationType = UITextAutocapitalizationTypeNone;
	tf.adjustsFontSizeToFitWidth = YES;
	//tf.textColor = [UIColor colorWithRed:56.0f/255.0f green:84.0f/255.0f blue:135.0f/255.0f alpha:1.0f];
	return tf ;
}

// Workaround to hide keyboard when Done is tapped
- (IBAction)textFieldFinished:(id)sender {
    // [sender resignFirstResponder];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 150;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0, 320, 44)] ; // x,y,width,height
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancelButton.frame = CGRectMake(200.0, 20, 160.0, 40.0); // x,y,width,height
    //[cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    
    
//    [cancelButton setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cancel" ofType:@"png"]]]];
    UIImage *btnImage =[UIImage imageNamed:@"cancel.png"];
    
   // UIImage *redIcon = [btnImage maskWithColor:UIColor.redColor];
    
    [cancelButton setImage:btnImage forState:UIControlStateNormal];
    
    
    [cancelButton addTarget:self
                     action:@selector(cancelbtnpress)
           forControlEvents:UIControlEventTouchDown];
    
    
    
    [headerView addSubview:cancelButton];
    
    /*
    UIButton *createButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    createButton.frame = CGRectMake(-30.0, 0, 160.0, 40.0); // x,y,width,height
    [createButton setTitle:@"注" forState:UIControlStateNormal];
    [createButton addTarget:self
                     action:@selector(createbtnpress)
           forControlEvents:UIControlEventTouchDown];
    [headerView addSubview:createButton];
    */
    
   // UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [loginButton setBackgroundColor:[UIColor redColor]];
    
    //[loginButton setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]]];
    
    loginButton.frame = CGRectMake(110.0, 240, 160.0, 40.0); // x,y,width,height
    //[loginButton setTitle:[words getword:@"confirm"] forState:UIControlStateNormal];
    
    
    
    [loginButton addTarget:self
                    action:@selector(confirmbtnpress)
           forControlEvents:UIControlEventTouchDown];
   // loginButton.buttonType=UIButtonTypeSystem;
    
    /*
    [loginButton.layer setMasksToBounds:YES];
    [loginButton.layer setCornerRadius:8.0]; //设置矩圆角半径
    [loginButton.layer setBorderWidth:1.0];   //边框宽度
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });
    [loginButton.layer setBorderColor:colorref];
    */
    
    [headerView addSubview:loginButton];
    
    
    return headerView;
}


// Textfield value changed, store the new value.
- (void)textFieldDidEndEditing:(UITextField *)textField {
	if ( textField == nameField_ ) {
		self.name = textField.text ;
	} else if ( textField == addressField_ ) {
		self.address = textField.text ;
	}
    else if ( textField == passwordField_ ) {
		self.password = textField.text ;
	} else if ( textField == descriptionField_ ) {
		self.description = textField.text ;
	}
}

@end

