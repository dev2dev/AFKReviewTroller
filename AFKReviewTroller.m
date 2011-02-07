//
//  AFKReviewTroller.m
//  AFKReviewTroller
//
//  Created by Marco Tabini on 11-02-06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AFKReviewTroller.h"

#define kAFKReviewTrollerRunCountDefault @"kAFKReviewTrollerRunCountDefault"


@implementation AFKReviewTroller

+ (void) load {
    NSAutoreleasePool *pool = [NSAutoreleasePool new];
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
        
    int numberOfExecutions = [standardDefaults integerForKey:kAFKReviewTrollerRunCountDefault] + 1;
    
    [[[AFKReviewTroller alloc] initWithNumberOfExecutions:numberOfExecutions] performSelector:@selector(setup) withObject:Nil afterDelay:1.0];
    
    [standardDefaults setInteger:numberOfExecutions forKey:kAFKReviewTrollerRunCountDefault];
    [standardDefaults synchronize];

    [pool release];
}


+ (int) numberOfExecutions {
    return [[NSUserDefaults standardUserDefaults] integerForKey:kAFKReviewTrollerRunCountDefault];
}


- (id) initWithNumberOfExecutions:(int) executionCount {
    if ((self = [super init])) {
        numberOfExecutions = executionCount;
    }
    
    return self;
}


- (void) setup {
    NSDictionary *bundleDictionary = [[NSBundle mainBundle] infoDictionary];
    
    if (numberOfExecutions == [[bundleDictionary objectForKey:kAFKReviewTrollerRunCount] intValue]) {
        NSString *title = NSLocalizedString([bundleDictionary objectForKey:kAFKReviewTrollerTitle], Nil);
        NSString *message = NSLocalizedString([bundleDictionary objectForKey:kAFKReviewTrollerMessage], Nil);
        
        UIAlertView *alertView = [[[UIAlertView alloc] initWithTitle:title 
                                                             message:message 
                                                            delegate:self
                                                   cancelButtonTitle:NSLocalizedString(@"No", Nil) 
                                                   otherButtonTitles:NSLocalizedString(@"Yes", Nil), Nil] 
                                  autorelease];
        [alertView show];
    }
}


- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        NSString *appId = [[[NSBundle mainBundle] infoDictionary] objectForKey:kAFKReviewTrollerAppID];

        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://userpub.itunes.apple.com/WebObjects/MZUserPublishing.woa/wa/addUserReview?id=%@&type=Purple+Software", appId]]];
    }
}


- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    [self release];
}


@end
