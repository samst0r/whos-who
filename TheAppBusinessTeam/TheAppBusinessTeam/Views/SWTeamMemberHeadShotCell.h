//
//  SWTeamMemberHeadShotCell.h
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 14/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SWHeadshotImageView;

@interface SWTeamMemberHeadShotCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet SWHeadshotImageView *headShotImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *positionLabel;

@end
