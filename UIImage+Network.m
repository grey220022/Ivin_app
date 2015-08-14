//
//  UIImageView+Network.m
//
//  Created by Soroush Khanlou on 8/25/12.
//
//

#import "FTWCache.h"
#import "UIImage+Network.h"
#import <objc/runtime.h>

static char URL_KEY;
static const void *iactivityIndicatorKEY = &iactivityIndicatorKEY;

@implementation UIImageView(Network)

@dynamic imageURL;
@dynamic iactivityIndicator;

UIActivityIndicatorView * imageactivityIndicator;

- (void) loadImageFromURL:(NSURL*)url placeholderImage:(UIImage*)placeholder cachingKey:(NSString*)key {
	self.imageURL = url;
    self.contentMode=UIViewContentModeScaleAspectFit;
	self.image = placeholder;
	
    
	NSData *cachedData = [FTWCache objectForKey:key];
	if (cachedData) {
        self.imageURL   = nil;
        self.image      = [UIImage imageWithData:cachedData];
        return;
	}
    self.iactivityIndicator=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    CGRect frame = self.iactivityIndicator.frame;
    frame.origin.x = self.frame.size.width / 2 - frame.size.width / 2;
    frame.origin.y = self.frame.size.height / 2 - frame.size.height / 2;
    self.iactivityIndicator.frame = frame;
    [self.iactivityIndicator startAnimating];
    [self addSubview:self.iactivityIndicator];
    [self.iactivityIndicator setHidesWhenStopped:YES];
	dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
	dispatch_async(queue, ^{
		NSData *data = [NSData dataWithContentsOfURL:url];
		UIImage *imageFromData = [UIImage imageWithData:data];
		[FTWCache setObject:data forKey:key];
		if (imageFromData) {
			if ([self.imageURL.absoluteString isEqualToString:url.absoluteString]) {
				dispatch_sync(dispatch_get_main_queue(), ^{
					self.image = imageFromData;
                    //[NSThread detachNewThreadSelector:@selector(threadStopAnimating:) toTarget:self withObject:nil];
				});
			} else {
                //				NSLog(@"urls are not the same, bailing out!");
			}
		}
        [NSThread detachNewThreadSelector:@selector(threadStopAnimating:) toTarget:self withObject:nil];
		self.imageURL = nil;
	});
}

- (void) setImageURL:(NSURL *)newImageURL {
	objc_setAssociatedObject(self, &URL_KEY, newImageURL, OBJC_ASSOCIATION_COPY);
    //[NSThread detachNewThreadSelector:@selector(threadStopAnimating:) toTarget:self withObject:nil];
}

- (void) threadStopAnimating:(id)data {
    [self.iactivityIndicator stopAnimating];
}


- (NSURL*) imageURL {
	return objc_getAssociatedObject(self, &URL_KEY);
}


- (void) setIactivityIndicator:(UIActivityIndicatorView *)iactivityIndicator {
    objc_setAssociatedObject(self, iactivityIndicatorKEY, iactivityIndicator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    //[NSThread detachNewThreadSelector:@selector(threadStopAnimating:) toTarget:self withObject:nil];
}

- (UIActivityIndicatorView*) iactivityIndicator {
    return objc_getAssociatedObject(self, iactivityIndicatorKEY);
}


@end