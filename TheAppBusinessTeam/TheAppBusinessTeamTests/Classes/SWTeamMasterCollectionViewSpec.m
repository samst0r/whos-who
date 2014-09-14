//
//  SWTeamMasterCollectionView.m
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 13/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import "Kiwi.h"

#import "SWTeamMasterCollectionViewController.h"

#import "SWTeamMember.h"
#import "SWTeamMemberHeadShotCell.h"

@interface SWTeamMasterCollectionViewController ()

@property (nonatomic, copy) NSArray *teamMembers;
- (void)refresh;

@end

SPEC_BEGIN(SWTeamMasterCollectionViewSpec)

describe(@"SWTeamMasterCollectionView", ^{
   
    context(@"Initialisation", ^{
        
        SWTeamMasterCollectionViewController __block  *teamMasterCollectionViewController;
        
        beforeEach(^{
            
            teamMasterCollectionViewController = [[SWTeamMasterCollectionViewController alloc] init];
        });
        
        it(@"should have be non-nil", ^{
            
            [[teamMasterCollectionViewController should] beNonNil];
        });
        
        it(@"should have a class of UICollectionViewController", ^{
           
            [[teamMasterCollectionViewController should] beKindOfClass:[SWTeamMasterCollectionViewController class]];
        });
    
        it(@"should have an array of team members", ^{
            
            [[teamMasterCollectionViewController should] respondToSelector:@selector(teamMembers)];
        });
        
        context(@"Team Members Array", ^{
            
            it(@"should call refresh", ^{
                
                SWTeamMasterCollectionViewController *refreshTestController = [SWTeamMasterCollectionViewController alloc];
                [[refreshTestController should] receive:@selector(refresh)];
                
                id __unused initialisedRefreshController = [refreshTestController init];
            });
            
            it(@"should set the array when the view is initialised", ^{
                
                [[theValue(teamMasterCollectionViewController.teamMembers.count) should] equal:theValue(3)];
            });
            
            it(@"should contain SWTeamMembers", ^{
                
                [[teamMasterCollectionViewController.teamMembers[0] should] beKindOfClass:[SWTeamMember class]];
                [[teamMasterCollectionViewController.teamMembers[1] should] beKindOfClass:[SWTeamMember class]];
                [[teamMasterCollectionViewController.teamMembers[2] should] beKindOfClass:[SWTeamMember class]];
            });
        });
    });
    
    context(@"Initialising from storyboard", ^{
       
        SWTeamMasterCollectionViewController __block *teamMasterCollectionViewController;
        
        beforeEach(^{
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
            
             teamMasterCollectionViewController = [storyboard instantiateViewControllerWithIdentifier:@"teamMasterViewController"];
        });
        
        it(@"should load from the storyboard and have a datasource and delegate", ^{
           
            [[(id)teamMasterCollectionViewController.collectionView.dataSource should] beNonNil];
            [[(id)teamMasterCollectionViewController.collectionView.delegate should] beNonNil];
        });
        
        it(@"should have 1 section", ^{
           
            [[theValue([teamMasterCollectionViewController.collectionView numberOfSections]) should] equal:theValue(1)];
        });
        
        it(@"should have a cell for each team member in section", ^{
            
            teamMasterCollectionViewController.teamMembers = @[
                                                               [[SWTeamMember alloc] init],
                                                               [[SWTeamMember alloc] init],
                                                               [[SWTeamMember alloc] init]
                                                               ];
           
            [[theValue([teamMasterCollectionViewController.collectionView numberOfItemsInSection:0]) should] equal:theValue(3)];
        });
        
        it(@"should have cells of type teamMemberHeadShotCell", ^{
           
            id cell = [teamMasterCollectionViewController.collectionView.dataSource
                       collectionView:teamMasterCollectionViewController.collectionView
                       cellForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
            
            [[cell should] beKindOfClass:[SWTeamMemberHeadShotCell class]];
        });
    });
});

SPEC_END
