//
//  WineView.h
//  Ivin
//
//  Created by user on 3/9/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WineView : UIViewController

{
@public
    UILabel *toplabel;
    UILabel *mainlabel;
    
}
@property(nonatomic,retain) IBOutlet UILabel *toplabel;
@property(nonatomic,retain) IBOutlet UILabel *mainlabel;
@property(nonatomic,retain) NSString *maintext;

- (void)changeText;
@end
