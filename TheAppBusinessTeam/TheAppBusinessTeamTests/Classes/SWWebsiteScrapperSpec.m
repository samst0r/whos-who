//
//  SWWebsiteScrapperSpec.m
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 14/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import "Kiwi.h"

#import "SWWebsiteScrapper.h"
#import "SWWebsiteParser.h"

SPEC_BEGIN(SWWebsiteScrapperSpec)

describe(@"SWWebsiteScrapper", ^{
    
    context(@"Scrapping", ^{
        
        it(@"should have a method for downloading and reacting to download", ^{
            
            [[SWWebsiteScrapper should] respondToSelector:@selector(downloadDataWithCompletionBlock:)];
        });
        
        it(@"should parse the data if the data has been successfully downloaded", ^{
            
            [SWWebsiteParser stub:@selector(parseTeamMembersFromData:)];
            
            [[SWWebsiteParser should] receive:@selector(parseTeamMembersFromData:)];
            
            [[NSURLSession sharedSession] stub:@selector(dataTaskWithURL:completionHandler:)
                                     withBlock:^id(NSArray *params) {
                                         
                                         void (^completionBlock)(NSData *data,
                                                                 NSURLResponse *response,
                                                                 NSError *error) = params[1];
                                         
                                         
                completionBlock([NSData data], [NSURLResponse mock], [NSError mock]);
                
                return nil;
            }];
            
            [SWWebsiteScrapper downloadDataWithCompletionBlock:^(BOOL success, NSArray *teamMembers) {
                
            }];
        });
        
        it(@"should download the image from the url and pass it back to the completion block", ^{

            __block UIImage *image = [[UIImage alloc] init];
            
            [[NSURLSession sharedSession] stub:@selector(dataTaskWithURL:completionHandler:)
                                     withBlock:^id(NSArray *params) {
                                         
                                         void (^completionBlock)(NSData *data,
                                                                 NSURLResponse *response,
                                                                 NSError *error) = params[1];
                                         
                                         completionBlock(image, [NSURLResponse mock], [NSError mock]);
                                         
                                         return nil;
                                     }];
            
            [SWWebsiteScrapper downloadImageFromURL:nil
                                withCompletionBlock:^(BOOL success, UIImage *image) {
                
            }];
        });
    });
});

SPEC_END