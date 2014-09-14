//
//  SWTeamMasterCollectionView.m
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 13/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import "Kiwi.h"

SPEC_BEGIN(SWTeamMasterCollectionView)

describe(@"SWTeamMasterCollectionView", ^{
   
    context(@"Initialisation", ^{
        
        it(@"should be a UICollectionViewController", ^{
           
            SWTeamMasterCollectionView *teamMasterCollectionView = [[SWTeamMasterCollectionView alloc] init];
            
            [[teamMasterCollectionView should] beKindOfClass:[SWTeamMasterCollectionView class]];
        });
    });
});

SPEC_END
