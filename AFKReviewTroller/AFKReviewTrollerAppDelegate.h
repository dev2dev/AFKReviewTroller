//
//  AFKReviewTrollerAppDelegate.h
//  AFKReviewTroller
//
//  Created by Marco Tabini on 11-02-06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AFKReviewTrollerViewController;

@interface AFKReviewTrollerAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet AFKReviewTrollerViewController *viewController;

@end
