//
//  SWTeamMember.m
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 14/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import "SWTeamMember.h"

@implementation SWTeamMember

- (instancetype)initWithFirstName:(NSString *)firstName
                          surname:(NSString *)surname
                      description:(NSString *)description
                         imageURL:(NSURL *)imageURL {
    
    self = [super init];
    
    if (self) {
        
        _firstName = [firstName copy];
        _surname = [surname copy];
        _description = [description copy];
        _imageURL = imageURL;
    }
    
    return self;
}

@end
