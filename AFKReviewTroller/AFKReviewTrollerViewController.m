//
//  AFKReviewTrollerViewController.m
//  AFKReviewTroller
//
//  Created by Marco Tabini on 11-02-06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AFKReviewTrollerViewController.h"
#import "AFKReviewTroller.h"

@implementation AFKReviewTrollerViewController
@synthesize runCountLabel;

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.runCountLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Run count: %d", 1), [AFKReviewTroller numberOfExecutions]];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
