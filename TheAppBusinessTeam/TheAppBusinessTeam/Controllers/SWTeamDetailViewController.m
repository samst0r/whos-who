//
//  SWTeamDetailViewController.m
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 15/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import "SWTeamDetailViewController.h"
#import "SWHeadshotImageView.h"

@interface SWTeamDetailViewController ()

@property (weak, nonatomic) IBOutlet SWHeadshotImageView *headShotImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *positionLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

@end

@implementation SWTeamDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.nameLabel.text = self.name;
    self.positionLabel.text = self.position;
    self.descriptionTextView.text = self.description;
    self.headShotImageView.image = self.headshotImage;
}

- (NSUInteger)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskPortrait;
}

@end

