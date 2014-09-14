//
//  SWTeamMasterCollectionView.m
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 14/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import "SWTeamMasterCollectionViewController.h"

#import "SWTeamMember.h"

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
}

#pragma mark - 

- (void)refresh {
    
    SWTeamMember *teamMember1 = [[SWTeamMember alloc] init];
    SWTeamMember *teamMember2 = [[SWTeamMember alloc] init];
    SWTeamMember *teamMember3 = [[SWTeamMember alloc] init];
    
    self.teamMembers = @[teamMember1, teamMember2, teamMember3];
}

#pragma mark - UICollectionViewDataSource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    
    return self.teamMembers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"teamHeadshotCellReuseIdentifier"
                                                                           forIndexPath:indexPath];
    
    return cell;
}

@end
