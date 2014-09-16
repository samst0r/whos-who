//
//  SWWebsiteScrapper.h
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 14/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWWebsiteScrapper : NSObject

+ (void)downloadDataWithCompletionBlock:(void (^)(BOOL success, NSArray *teamMembers))completionBlock;
+ (void)downloadImageFromURL:(NSURL *)url withCompletionBlock:(void (^)(BOOL success, UIImage *image))completionBlock;

@end
