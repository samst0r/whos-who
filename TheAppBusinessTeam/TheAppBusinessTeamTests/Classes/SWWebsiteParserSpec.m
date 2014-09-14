//
//  SWWebsiteParserSpec.m
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 14/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import "Kiwi.h"

#import "SWWebsiteParser.h"
#import "SWTeamMember.h"

SPEC_BEGIN(SWWebsiteParserSpec)

describe(@"SWWebsiteParser", ^{
    
    context(@"Parsing", ^{
       
        it(@"should have a method for parsing website data", ^{
           
            [[SWWebsiteParser should] respondToSelector:@selector(parseTeamMembersFromData:)];
        });
        
        it(@"should parse the employees from the data", ^{
            
            NSBundle *bundle = [NSBundle bundleForClass:[self class]];
            NSString *htmlFilePath = [bundle pathForResource:@"testWebsite" ofType:@"html"];
            
            NSData *htmlData = [NSData dataWithContentsOfFile:htmlFilePath];
            
            NSArray *teamMembers = [SWWebsiteParser parseTeamMembersFromData:htmlData];
            
            [[theValue(teamMembers.count) should] equal:theValue(41)];
            
            SWTeamMember *teamMember = teamMembers[0];
            [[teamMember.firstName should] equal:@"Daniel"];
            [[teamMember.surname should] equal:@"Joseph"];
            [[teamMember.position should] equal:@"Founder, Strategy Director"];
            [[teamMember.description should] equal:@"Daniel was previously European Planning Director for Apple at Media Arts Lab, launching the iPhone, App Store and hundreds of apps. Prior to this, Daniel spent his career planning advertising and communications for Sony Computer Entertainment Europe and Mars. He has a BA in Geography from Keble College, Oxford."];
        });
    });
});

SPEC_END