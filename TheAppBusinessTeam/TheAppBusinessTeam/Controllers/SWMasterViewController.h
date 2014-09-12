//
//  SWMasterViewController.h
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 12/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SWDetailViewController;

@interface SWMasterViewController : UITableViewController

@property (strong, nonatomic) SWDetailViewController *detailViewController;

@end
