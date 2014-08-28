//
//  ProfileCityView.m
//  Ivin
//
//  Created by user on 3/26/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "ProfileCityView.h"

@interface ProfileCityView ()
@end
NSArray *_pickerData;
UIPickerView * pickerView;
UIPickerView *myPickerView ;


@implementation ProfileCityView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)click1
{
    [self.t2 resignFirstResponder];
    [self.text resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.text.layer.borderWidth =1.0;
    self.text.layer.cornerRadius =5.0;
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];
    _pickerData = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5", @"Item 6"];
    _t2.delegate=self;
    
    
    UIPickerView *myPickerView =[[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
    myPickerView.dataSource=self;
    myPickerView.delegate=self;
    myPickerView.showsSelectionIndicator = YES;
    _t2.inputView = myPickerView;
    UIToolbar *myToolbar = [[UIToolbar alloc] initWithFrame:
                            CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
    UIBarButtonItem *doneButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                  target:self action:@selector(inputAccessoryViewDidFinish)];
    [myToolbar setItems:[NSArray arrayWithObject: doneButton] animated:NO];
    _t2.inputAccessoryView = myToolbar;
    
    
    
    UITapGestureRecognizer* gesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click1)];
    [self.view setUserInteractionEnabled:YES];
    [self.view addGestureRecognizer:gesture1];

}

-(void)inputAccessoryViewDidFinish
{
    [self.t2 resignFirstResponder];
    //_t2.text=[_pickerData objectAtIndex: [myPickerView selectedRowInComponent:1]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}


- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    
    _t2.text = [_pickerData objectAtIndex:row];
    
}


/*
- (BOOL) textFieldShouldBeginEditing:(UITextView *)textView
{

    return NO;
}*/



@end
