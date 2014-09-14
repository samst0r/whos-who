//
//  SWHeadshotImageView.m
//  TheAppBusinessTeam
//
//  Created by Samuel Ward on 15/09/2014.
//  Copyright (c) 2014 Samuel Ward. All rights reserved.
//

#import "SWHeadshotImageView.h"

@implementation SWHeadshotImageView

- (instancetype)initWithCoder:(NSCoder *)coder {
    
    self = [super initWithCoder:coder];
    
    if (self) {
        
        self.layer.cornerRadius = CGRectGetHeight(self.frame) / 2;
        self.layer.masksToBounds = YES;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.borderWidth = 1.0;
    }
    
    return self;
}

@end
