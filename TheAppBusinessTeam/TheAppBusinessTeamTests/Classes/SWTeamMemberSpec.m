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
           
            NSURL *url = [NSURL URLWithString:@"www.google.com"];
            
            SWTeamMember *teamMember = [[SWTeamMember alloc] initWithFirstName:@"firstName"
                                                                       surname:@"surname"
                                                                   description:@"description"
                                                                      imageURL:url];
            
            [[teamMember.firstName should] equal:@"firstName"];
            [[teamMember.surname should] equal:@"surname"];
            [[teamMember.description should] equal:@"description"];
            [[teamMember.imageURL should] equal:url];
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
            
            it(@"should have a readonly description", ^{
                
                SWTeamMember *teamMember = [[SWTeamMember alloc] init];
                
                [[teamMember should] respondToSelector:@selector(description)];
                [[teamMember shouldNot] respondToSelector:@selector(setDescription:)];
            });
            
            it(@"should have a readonly imageURL", ^{
                
                SWTeamMember *teamMember = [[SWTeamMember alloc] init];
                
                [[teamMember should] respondToSelector:@selector(imageURL)];
                
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
                [[teamMember shouldNot] respondToSelector:@selector(setImageURL:)];
#pragma clang diagnostic pop
            });
        });
    });
});

SPEC_END
