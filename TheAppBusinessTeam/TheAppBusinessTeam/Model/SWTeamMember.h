//
//  SWTeamMember.h
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 14/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWTeamMember : NSObject <NSCoding>

@property (nonatomic, readonly, copy) NSString *firstName;
@property (nonatomic, readonly, copy) NSString *surname;
@property (nonatomic, readonly, copy) NSString *position;
@property (nonatomic, readonly, copy) NSString *description;
@property (nonatomic, readonly, copy) NSString *imageURL;

@property (nonatomic) UIImage *image;

- (instancetype)initWithFirstName:(NSString *)firstName
                          surname:(NSString *)surname
                         position:(NSString *)position
                      description:(NSString *)description
                         imageURL:(NSString *)imageURL;

- (void)getImageWithCompletionBlock:(void (^)())completionBlock;

@end
