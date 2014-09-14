//
//  SWWebsiteScrapper.m
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 14/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import "SWWebsiteScrapper.h"
#import "SWWebsiteParser.h"

static NSString *websiteURL = @"http://www.theappbusiness.com/our-team/";

@implementation SWWebsiteScrapper

+ (void)downloadDataWithCompletionBlock:(void (^)(BOOL success, NSArray *teamMembers))completionBlock {
    
    NSURLSession *session = [NSURLSession sharedSession];
     
    [[session dataTaskWithURL:[NSURL URLWithString:websiteURL]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {

                completionBlock((error == nil), [SWWebsiteParser parseTeamMembersFromData:data]);
                
            }] resume];
}

+ (void)downloadImageFromURL:(NSURL *)url withCompletionBlock:(void (^)(BOOL success, UIImage *image))completionBlock {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                
                UIImage *image = [UIImage imageWithData:data];
                
                completionBlock((error == nil), image);
                
            }] resume];
}

@end
