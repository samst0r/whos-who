//
//  SWAppDelegate.m
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 12/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import "SWAppDelegate.h"

@implementation SWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setupNSURLSessionCache];
    
    return YES;
}

- (void)setupNSURLSessionCache {
    
    NSUInteger cacheSizeMemory = 50 * 1024 * 1024;
    NSUInteger cacheSizeDisk = 50 * 1024 * 1024;
    
    NSURLCache *sharedCache = [[NSURLCache alloc] initWithMemoryCapacity:cacheSizeMemory
                                                            diskCapacity:cacheSizeDisk
                                                                diskPath:@"nsurlcache"];
    
    [NSURLCache setSharedURLCache:sharedCache];
    sleep(1);
}
@end
