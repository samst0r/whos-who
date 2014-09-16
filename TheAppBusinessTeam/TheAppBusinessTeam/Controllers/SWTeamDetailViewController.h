//
//  SWTeamDetailViewController.h
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 15/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SWHeadshotImageView;

@interface SWTeamDetailViewController : UIViewController

@property (nonatomic, copy) NSString *position;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) UIImage *headshotImage;
@property (nonatomic, copy) NSString *description;

@end
