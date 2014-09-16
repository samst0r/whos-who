//
//  SWTeamMemberSpec.m
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 14/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import "Kiwi.h"

#import "SWTeamMember.h"

SPEC_BEGIN(SWTeamMemberSpec)

describe(@"SWTeamMember", ^{
   
    context(@"Initialisation", ^{
       
        it(@"should be non-nil", ^{
          
            SWTeamMember *teamMember = [[SWTeamMember alloc] init];
            [[teamMember should] beNonNil];
        });
        
        it(@"should set the firstname, surname, description and imageURL", ^{
           
//            UIImage *image = [[UIImage alloc] init];
            
            SWTeamMember *teamMember = [[SWTeamMember alloc] initWithFirstName:@"firstName"
                                                                       surname:@"surname"
                                                                      position:@"position"
                                                                   description:@"description"
                                                                      imageURL:@"imageURL"];
            
            [[teamMember.firstName should] equal:@"firstName"];
            [[teamMember.surname should] equal:@"surname"];
            [[teamMember.position should] equal:@"position"];
            [[teamMember.description should] equal:@"description"];
//            [[teamMember.image should] equal:image];
        });
        
        context(@"Properties", ^{
           
            it(@"should have a readonly first name", ^{
                
                SWTeamMember *teamMember = [[SWTeamMember alloc] init];
                
                [[teamMember should] respondToSelector:@selector(firstName)];
                
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
                [[teamMember shouldNot] respondToSelector:@selector(setFirstName:)];
#pragma clang diagnostic pop
            });
            
            it(@"should have a readonly surname", ^{
                
                SWTeamMember *teamMember = [[SWTeamMember alloc] init];
                
                [[teamMember should] respondToSelector:@selector(surname)];
                
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
                [[teamMember shouldNot] respondToSelector:@selector(setSurname:)];
#pragma clang diagnostic pop
            });
            
            it(@"should have a readonly surname", ^{
                
                SWTeamMember *teamMember = [[SWTeamMember alloc] init];
                
                [[teamMember should] respondToSelector:@selector(surname)];
                
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
                [[teamMember shouldNot] respondToSelector:@selector(setSurname:)];
#pragma clang diagnostic pop
            });
            
            it(@"should have a readonly position", ^{
                
                SWTeamMember *teamMember = [[SWTeamMember alloc] init];
                
                [[teamMember should] respondToSelector:@selector(position)];
                [[teamMember shouldNot] respondToSelector:@selector(setPosition:)];
            });
            
            it(@"should have a readonly imageURL", ^{
                
                SWTeamMember *teamMember = [[SWTeamMember alloc] init];
                
                [[teamMember should] respondToSelector:@selector(image)];
                
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
                [[teamMember shouldNot] respondToSelector:@selector(setImage:)];
#pragma clang diagnostic pop
            });
        });
    });
});

SPEC_END
