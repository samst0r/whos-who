//
//  SWWebsiteParser.m
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 14/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import "SWWebsiteParser.h"

#import "SWTeamMember.h"

#import "TFHpple.h"

@implementation SWWebsiteParser

+ (NSArray *)parseTeamMembersFromData:(NSData *)data {
    
    TFHpple *document = [[TFHpple alloc] initWithHTMLData:data];
    
    NSArray *teamMemberElements = [document searchWithXPathQuery:@"//*[@id='users']/div/div/div"];
    
    NSMutableArray *teamMembers = [[NSMutableArray alloc] init];
    
    for (id teamMemberElement in teamMemberElements) {
    
        NSArray *names = [[[teamMemberElement firstChildWithTagName:@"h3"] text] componentsSeparatedByString:@" "];
        
        NSString *firstName = [names firstObject];
        NSString *surname = [names lastObject];
        
        NSString *position = [[teamMemberElement firstChildWithTagName:@"p"] text];
        NSString *description = [[teamMemberElement firstChildWithClassName:@"user-description"] text];
        
        [teamMemberElement firstChildWithClassName:@"title"];
        
        NSString *imageURL = [[[teamMemberElement firstChildWithClassName:@"title"] firstChildWithTagName:@"img"] objectForKey:@"src"];
        
        SWTeamMember *teamMember = [[SWTeamMember alloc] initWithFirstName:firstName
                                                                   surname:surname
                                                                  position:position
                                                               description:description
                                                                  imageURL:imageURL];
        
        [teamMembers addObject:teamMember];
    }
    
    return teamMembers;
}

@end
