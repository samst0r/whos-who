//
//  SWDetailViewController.h
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 12/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
