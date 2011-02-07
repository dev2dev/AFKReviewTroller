//
//  AFKReviewTroller.h
//  AFKReviewTroller
//
//  Created by Marco Tabini on 11-02-06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kAFKReviewTrollerRunCount @"AFKReviewTrollerRunCount"
#define kAFKReviewTrollerTitle @"AFKReviewTrollerTitle"
#define kAFKReviewTrollerMessage @"AFKReviewTrollerMessage"
#define kAFKReviewTrollerAppID @"AFKReviewTrollerAppID"


@interface AFKReviewTroller : NSObject <UIAlertViewDelegate> {
    
    int numberOfExecutions;
    
}


+ (int) numberOfExecutions;

- (id) initWithNumberOfExecutions:(int) executionCount;


@end
