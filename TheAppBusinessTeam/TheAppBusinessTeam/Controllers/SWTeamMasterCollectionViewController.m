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

@interface SWTeamMasterCollectionViewController () <UICollectionViewDataSource>

@property (nonatomic, copy) NSArray *teamMembers;

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
    
    self.title = @"Team Members Master View";
    self.collectionView.alwaysBounceVertical = YES;
}

#pragma mark -

- (void)refresh {
    
    [SWWebsiteScrapper downloadDataWithCompletionBlock:^(BOOL success, NSArray *teamMembers) {
       
        if (success) {
            
            self.teamMembers = teamMembers;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.collectionView.alpha = 0.0f;
                [UIView animateWithDuration:0.3f animations:^{
                    
                    [self.collectionView reloadData];
                    self.collectionView.alpha = 1.0f;
                }];
            });
            
            for (int i = 0; i < self.teamMembers.count; ++i) {
                
                SWTeamMember *teamMember = self.teamMembers[i];
                
                [teamMember getImageWithCompletionBlock:^{
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        [self.collectionView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:i inSection:0]]];
                    });
                }];
            }
        }
    }];
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

@end
