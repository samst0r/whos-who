//
//  SWTeamMember.h
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 14/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWTeamMember : NSObject

@property (nonatomic, readonly, copy) NSString *firstName;
@property (nonatomic, readonly, copy) NSString *surname;
@property (nonatomic, readonly, copy) NSString *description;
@property (nonatomic, readonly) NSURL *imageURL;

- (instancetype)initWithFirstName:(NSString *)firstName
                          surname:(NSString *)surname
                      description:(NSString *)description
                         imageURL:(NSURL *)imageURL;

@end
