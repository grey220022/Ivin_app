
//
//  RootViewController.m
//  NewProject
//
//  Created by 学鸿 张 on 13-11-29.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "RootViewController.h"
#import "AcceptWineViewController.h"
#import "SingletonClass.h"
#import "IvinHelp.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    
    NSLog(@"firstappear");
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor blackColor];
    _activityIndicator = [[UIActivityIndicatorView alloc]
                          initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    [_activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:_activityIndicator];
    _activityIndicator.center=CGPointMake(160, 250);
    _activityIndicator.hidesWhenStopped = YES;

    
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"chateau" ofType:@"png"]]];

    
	//UIButton * scanButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //[scanButton setTitle:@"取消" forState:UIControlStateNormal];
    //scanButton.frame = CGRectMake(100, 420, 120, 40);
    //[scanButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:scanButton];


    
    UILabel * labIntroudction= [[UILabel alloc] initWithFrame:CGRectMake(15, 40, 290, 50)];
    labIntroudction.backgroundColor = [UIColor clearColor];
    labIntroudction.numberOfLines=2;
    labIntroudction.textColor=[UIColor whiteColor];
    //labIntroudction.text=@"将二维码图像置于矩形方框内，离手机摄像头10CM左右，系统会自动识别。";
    [self.view addSubview:labIntroudction];
    
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 100, 300, 300)];
    imageView.image = [UIImage imageNamed:@"pick_bg"];
    [self.view addSubview:imageView];
    
    upOrdown = NO;
    num =0;
    _line = [[UIImageView alloc] initWithFrame:CGRectMake(50, 110, 220, 2)];
    _line.image = [UIImage imageNamed:@"line.png"];
    [self.view addSubview:_line];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(animation1) userInfo:nil repeats:YES];
    
   
    //[self setupCamera];

  //  [self updateName];
    _activityIndicator = [[UIActivityIndicatorView alloc]
                          initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    [_activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:_activityIndicator];
    _activityIndicator.center=CGPointMake(160, 250);
    _activityIndicator.hidesWhenStopped = YES;
    
    self.tabBarController.delegate=self;
}



- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;
{
    if (self==viewController)
    {
        [[SingletonClass sharedInstance].listview.navigationController popToRootViewControllerAnimated:NO];
      NSLog(@"tabx");
    }
}


-(void)animation1
{
    if (upOrdown == NO) {
        num ++;
        _line.frame = CGRectMake(50, 110+2*num, 220, 2);
        if (2*num == 280) {
            upOrdown = YES;
        }
    }
    else {
        num --;
        _line.frame = CGRectMake(50, 110+2*num, 220, 2);
        if (num == 0) {
            upOrdown = NO;
        }
    }

}
-(void)backAction
{
    
    [self dismissViewControllerAnimated:YES completion:^{
        [timer invalidate];
    }];
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"appear");
    [self setupCamera];
}

-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"disappear");
    [_session stopRunning];
    [_preview removeFromSuperlayer];
}





- (void)setupCamera
{
    
    
    // Device
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Input
    _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    // Output
    _output = [[AVCaptureMetadataOutput alloc]init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    // Session
    _session = [[AVCaptureSession alloc]init];
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([_session canAddInput:self.input])
    {
        [_session addInput:self.input];
    }
    
    if ([_session canAddOutput:self.output])
    {
        [_session addOutput:self.output];
    }
    
    // 条码类型 AVMetadataObjectTypeQRCode
    _output.metadataObjectTypes =@[AVMetadataObjectTypeQRCode];
    
    // Preview
    _preview =[AVCaptureVideoPreviewLayer layerWithSession:self.session];
    _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _preview.frame =CGRectMake(20,110,280,280);
    [self.view.layer insertSublayer:self.preview atIndex:0];
    

    
    // Start
    [_session startRunning];
}


-(void)actIndicatorBegin
{
    [_activityIndicator startAnimating];
}




- (IBAction)updateName{
    [_session stopRunning];
    [_preview removeFromSuperlayer];
    
    
}


#pragma mark AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    NSString *stringValue;
    if ([metadataObjects count] >0)
    {
        //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:stringValue]];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
        NSLog(@"%@",stringValue);

        [self performSelectorOnMainThread:@selector(updateName) withObject:nil waitUntilDone:YES];
        
        
        [NSThread detachNewThreadSelector: @selector(actIndicatorBegin) toTarget:self withObject:nil];
        NSData* winestring=[IvinHelp geturlcontent:@"http://www.ivindigital.com/api/wine/5"];
        NSData* winerystring=[IvinHelp geturlcontent:@"http://www.ivindigital.com/api/winery/8"];
        
        if ((!winerystring) || (!winestring))
        {
            UIAlertView *myAlertView;
            myAlertView = [[UIAlertView alloc]initWithTitle:@"Network error" message:@"Please try it later." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [myAlertView show];
        }
        
        [IvinHelp wineryparse:winerystring];
        
        [IvinHelp wineparse:winestring];
        
        [_activityIndicator stopAnimating];
        
        NSLog(@"2");
        NSLog(@"%@",[SingletonClass sharedInstance].winery.Name);

        [SingletonClass sharedInstance].fromscan=1;
        [self.tabBarController setSelectedIndex:1];

        
        
      //  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:stringValue]];
    }
   // [_session stopRunning];
//   [self dismissViewControllerAnimated:YES completion:^
//    {
//        [timer invalidate];
//    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
