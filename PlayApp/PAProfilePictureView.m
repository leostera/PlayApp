//
//  PAProfilePictureView.m
//  PlayApp
//
//  Created by Leandro Ostera Villalva on 5/11/14.
//  Copyright (c) 2014 Leandro Ostera. All rights reserved.
//

#import "PAProfilePictureView.h"

@implementation PAProfilePictureView

- (id) init {
    self = [super init];
    if (self) {
        self.layer.cornerRadius = 5.0f;
        self.clipsToBounds = YES;
    }
    return self;
}

@end
