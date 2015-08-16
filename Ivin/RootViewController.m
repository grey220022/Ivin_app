
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
#import "WQPlaySound.h"
#import "words.h"

bool isreading;
int tim;

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
    isreading=NO;
    tim=0;
    //NSLog(@"firstappear");
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
    
    
    
//    NSData* winestring=[IvinHelp geturlcontent:@"http://www.ivindigital.com/api/wine/5"];
//    NSData* winerystring=[IvinHelp geturlcontent:@"http://www.ivindigital.com/api/winery/8"];
//    [IvinHelp wineryparse:winerystring];
//    [IvinHelp wineparse:winestring];

   // [SingletonClass sharedInstance].wine.Wine=@"bbb";
   // [SingletonClass sharedInstance].winery.Name=@"ccc";
    
    
//    NSLog(@"%@",[SingletonClass sharedInstance].winery.Name);
//    NSLog(@"%@",[SingletonClass sharedInstance].wine.Wine);
}

- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
//    if (([SingletonClass sharedInstance].username!=nil)&&([SingletonClass sharedInstance].firstswitch))
//    if ([SingletonClass sharedInstance].firstswitch)
//    {
//        [self.tabBarController setSelectedIndex:1];
//    }
//    [self.tabBarController setSelectedIndex:2];
//    [SingletonClass sharedInstance].firstswitch=false;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;
{
    if (self==viewController)
    {
        [[SingletonClass sharedInstance].listview.navigationController popToRootViewControllerAnimated:NO];
     // NSLog(@"tabx");
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
    [super viewWillAppear:animated];
    isreading=NO;
    //NSLog(@"appear");
    
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(authStatus == AVAuthorizationStatusAuthorized)
    {
      [self setupCamera];
    }
    
    
    //todo : unline the following code before submitting
    
    /*
    
    
    NSString * wineurl;
    NSString * wineryurl;
    
    
    NSString *winenumber=@"2";//[[stringValue substringFromIndex:nn-4]substringToIndex:1];
    
    //@"http://lapinroi-001-site1.smarterasp.net/WineCard/DetailsWineryIndex?wineCode=FR00009001"
    
    
    wineurl= [NSString stringWithFormat:@"%@%@",@"http://lapinroi-001-site1.smarterasp.net/api/wine/",winenumber];
    wineryurl= [NSString stringWithFormat:@"%@%@", @"http://lapinroi-001-site1.smarterasp.net/api/winery/",winenumber];
    
    
    //        NSLog(@"%@",wineurl);
    //        NSLog(@"%@",wineryurl);
    
    //        NSData* winestring=[IvinHelp geturlcontent:@"http://www.ivindigital.com/api/wine/5"];
    //        NSData* winerystring=[IvinHelp geturlcontent:@"http://www.ivindigital.com/api/winery/8"];
    
    
    NSData* winestring=[IvinHelp geturlcontent:wineurl];
    NSData* winerystring=[IvinHelp geturlcontent:wineryurl];
    
    
    //NSLog(@"end");
    if ((!winerystring) || (!winestring)||([winestring length]==0)||([winerystring length]==0))
    {
        UIAlertView *myAlertView;
        myAlertView = [[UIAlertView alloc]initWithTitle:@"Erreur de réseau" message:@"Essayez plus tard." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [myAlertView show];
        return;
    }
    
    [self performSelectorOnMainThread:@selector(updateName) withObject:nil waitUntilDone:NO];
    [IvinHelp wineryparse:winerystring];
    [IvinHelp wineparse:winestring];
    [_activityIndicator stopAnimating];
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AcceptWineViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"AcceptWine"];
    [self.navigationController pushViewController:nextController animated:YES];
    
    
    
    */
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [SingletonClass sharedInstance].preview=@"scan";
   // NSLog(@"disappear");
    [_session stopRunning];
    [_preview removeFromSuperlayer];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
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
    //todo
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
//    tim++;
//    NSLog(@"times : %d",tim);
    if (isreading)
        return;
    isreading=YES;
    NSString *stringValue;
    if ([metadataObjects count] >0)
    {
        //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:stringValue]];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
        //NSLog(@"%@",stringValue);
        
        
        
        [NSThread detachNewThreadSelector: @selector(actIndicatorBegin) toTarget:self withObject:nil];
        
//        NSLog(@"%d",[stringValue rangeOfString:@"lapinroi-001-site1"].location);
        if ([stringValue rangeOfString:@"ivintag.com"].location==NSNotFound)
        {
            /*
            UIAlertView *myAlertView;
            myAlertView = [[UIAlertView alloc]initWithTitle:@"QR code erreur" message:@"Essayez plus tard." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [myAlertView show];
             */
            NSURL *cleanURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@", stringValue]];
            [[UIApplication sharedApplication] openURL:cleanURL];
            [_activityIndicator stopAnimating];
            isreading=NO;
            return;
        }
        NSString * wineurl;
       // NSString * wineryurl;
        
        int nn=stringValue.length;
        
//         NSString *winenumber=[stringValue substringToIndex:nn-4];
        
        //NSString *winenumber=[[stringValue substringFromIndex:nn-4]substringToIndex:1];
        NSString *winenumber=[stringValue substringFromIndex:nn-10];
        //@"http://lapinroi-001-site1.smarterasp.net/WineCard/DetailsWineryIndex?wineCode=FR00009001"
        //http://lapinroi-001-site1.smarterasp.net/api/wine?winecode=FR00009001

        NSString* l=[SingletonClass sharedInstance].lang;
        if ((![l isEqual:@"en"])&& (![l isEqual:@"zh"]))
            l=@"fr";
        wineurl= [NSString stringWithFormat:@"%@%@%@%@",@"http://www.ivintag.com/api/wine?winecode=",winenumber,@"&lang=",l];
        
        //wineurl= [NSString stringWithFormat:@"%@%@",@"http://www.ivintag.com/api/wine?winecode=",winenumber];
      //  wineryurl= [NSString stringWithFormat:@"%@%@", @"http://lapinroi-001-site1.smarterasp.net/api/winery/",winenumber];
        //http://www.ivintag.com/api/wine?winecode=FR00009001
        
       // NSLog(@"%@",wineurl);
//        NSLog(@"%@",wineryurl);
        
//        NSData* winestring=[IvinHelp geturlcontent:@"http://www.ivindigital.com/api/wine/5"];
//        NSData* winerystring=[IvinHelp geturlcontent:@"http://www.ivindigital.com/api/winery/8"];
        
        [SingletonClass sharedInstance].fromscan=1;
        NSData* winestring=[IvinHelp geturlcontentfromcache:wineurl];
       // NSData* winerystring=[IvinHelp geturlcontent:wineryurl];

        
        //NSLog(@"end");
        if ((!winestring)||([winestring length]==0))
        {
            UIAlertView *myAlertView;
            myAlertView = [[UIAlertView alloc]initWithTitle:[words getword:@"error"] message:[words getword:@"networkerror"] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [myAlertView show];
            [_activityIndicator stopAnimating];
            [SingletonClass sharedInstance].fromscan=0;
            return;
        }
        
        [self performSelectorOnMainThread:@selector(updateName) withObject:nil waitUntilDone:NO];
//        [IvinHelp wineryparse:winerystring];
        [IvinHelp wineparse:winestring];
        
        
        /*
        if (([SingletonClass sharedInstance].username!=nil))
            //&& ([[SingletonClass sharedInstance].wineset containsObject:[SingletonClass sharedInstance].wine.Id]))
        {
            NSString *url=[NSString stringWithFormat:@"http://lapinroi-001-site1.smarterasp.net/api/EndUserWine/GetInfo?enduserid=%@&wineid=%@",[SingletonClass sharedInstance].username,[SingletonClass sharedInstance].wine.Id];
            NSLog(@"%@",url);
            NSData* userwine=[IvinHelp geturlcontent:url];
            
            NSString* newStr = [[NSString alloc] initWithData:userwine encoding:NSUTF8StringEncoding];
            NSLog(@"%@",newStr);
            [IvinHelp wineidparse:userwine];
        }
        */
        [_activityIndicator stopAnimating];
        
        /*
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        AcceptWineViewController *nextController = [storyboard instantiateViewControllerWithIdentifier:@"AcceptWine"];
        [self.navigationController pushViewController:nextController animated:YES];
        */
        WQPlaySound *sound = [[WQPlaySound alloc]initForPlayingVibrate];
        
        [sound play];

        
        [self.tabBarController setSelectedIndex:2];
        
        
        
      //  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:stringValue]];
    }
   // [_session stopRunning];
//   [self dismissViewControllerAnimated:YES completion:^
//    {
//        [timer invalidate];
//    }];
    //isreading=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [_activityIndicator stopAnimating];
    isreading=NO;

}


@end
