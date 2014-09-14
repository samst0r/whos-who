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
                         position:(NSString *)position
                      description:(NSString *)description
                         imageURL:(UIImage *)imageURL {
    
    self = [super init];
    
    if (self) {
        
        _firstName = [firstName copy];
        _surname = [surname copy];
        _position = [position copy];
        _description = [description copy];
        _imageURL = [imageURL copy];
    }
    
    return self;
}

+ (UIImage *)imageWithImage:(UIImage *)image
               scaledToSize:(CGSize)newSize {
    
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (void)getImageWithCompletionBlock:(void (^)())completionBlock {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    __weak typeof(self) weakSelf = self;
    
    [[session dataTaskWithURL:[NSURL URLWithString:self.imageURL]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                
                __strong typeof(self) strongSelf = weakSelf;
                
                UIImage *image = [UIImage imageWithData:data];
                
                [SWTeamMember imageWithImage:image scaledToSize:CGSizeMake(100, 100)];
                
                strongSelf.image = image;
                
                completionBlock();
                
            }] resume];
}


@end
