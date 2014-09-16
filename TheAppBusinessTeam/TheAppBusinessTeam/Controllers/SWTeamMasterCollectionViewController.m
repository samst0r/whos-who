//
//  SWTeamMasterCollectionView.m
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 14/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import "SWTeamMasterCollectionViewController.h"

#import "SWTeamMember.h"
#import "SWTeamMemberHeadShotCell.h"
#import "SWWebsiteScrapper.h"
#import "SWTeamDetailViewController.h"
#import "SWHeadshotImageView.h"

@interface SWTeamMasterCollectionViewController () <UICollectionViewDataSource>

@property (nonatomic, copy) NSArray *teamMembers;
@property (nonatomic) UILabel *error;

@end

@implementation SWTeamMasterCollectionViewController

#pragma mark - Initialisation 

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        [self refresh];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        [self refresh];
    }
    
    return self;
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Meet The Team";
    self.collectionView.alwaysBounceVertical = YES;
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Refreshing

- (void)loadImagesForTeamMembers {
    
    for (int i = 0; i < self.teamMembers.count; ++i) {
        
        SWTeamMember *teamMember = self.teamMembers[i];
        
        [teamMember getImageWithCompletionBlock:^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
            
                NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
                SWTeamMemberHeadShotCell *cell = (SWTeamMemberHeadShotCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
                
                [self.collectionView performBatchUpdates:^{
                    
                    [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
                    
                    cell.headShotImageView.alpha = 1.0f;
                } completion:^(BOOL finished) {
                    
                }];
            });
        }];
    }
}

- (void)refresh {
    
    [SWWebsiteScrapper downloadDataWithCompletionBlock:^(BOOL success, NSArray *teamMembers) {
       
        if (success) {
            
            self.teamMembers = teamMembers;
            
            dispatch_async(dispatch_get_main_queue(), ^{

                [self.collectionView reloadData];
            });
            
            [self loadImagesForTeamMembers];
            
        } else {
            
            [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil)
                                       message:NSLocalizedString(@"An internet connection is needed initally, press Refresh when you have data access", nil)
                                      delegate:nil
                             cancelButtonTitle:NSLocalizedString(@"Okay", nil)
                             otherButtonTitles:nil] show];
        }
    }];
}

- (IBAction)refreshBarButtonPressed:(id)sender {
    
    [self refresh];
}

#pragma mark - UICollectionViewDataSource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    
    return self.teamMembers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SWTeamMemberHeadShotCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"teamHeadshotCellReuseIdentifier"
                                                                               forIndexPath:indexPath];
            
    SWTeamMember *teamMember = self.teamMembers[indexPath.item];
    
    cell.nameLabel.text = [NSString stringWithFormat:@"%@ %@", teamMember.firstName, teamMember.surname];
    cell.positionLabel.text = teamMember.position;
    cell.headShotImageView.image = teamMember.image;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    SWTeamDetailViewController *vc = [segue destinationViewController];
    
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
    
    SWTeamMember *teamMember = self.teamMembers[indexPath.item];
    
    vc.name = [NSString stringWithFormat:@"%@ %@", teamMember.firstName, teamMember.surname];
    
    vc.headshotImage = teamMember.image;
    vc.position = teamMember.position;
    vc.description = teamMember.description;
    
    vc.title = [NSString stringWithFormat:@"%@ %@", teamMember.firstName, teamMember.surname];
}

@end
