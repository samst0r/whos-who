//
//  SWTeamMemberHeadShotCellSpec.m
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 14/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import "Kiwi.h"

#import "SWTeamMemberHeadShotCell.h"


SPEC_BEGIN(SWTeamMemberHeadShotCellSpec)

describe(@"SWTeamMemberHeadShotCell", ^{
   
    context(@"Initialisation", ^{
        
        SWTeamMemberHeadShotCell __block *cell;
        
        beforeEach(^{
            
            cell = [[SWTeamMemberHeadShotCell alloc] init];
        });
       
        it(@"should have a name label", ^{
            
            [[cell should] respondToSelector:@selector(headShotImageView)];
        });
        
        it(@"should have an image view", ^{
           
            [[cell should] respondToSelector:@selector(nameLabel)];
        });
        
        it(@"should have an position label", ^{
            
            [[cell should] respondToSelector:@selector(positionLabel)];
        });
    });
});

SPEC_END
