//
//  PALoginView.m
//  PlayApp
//
//  Created by Leandro Ostera Villalva on 5/11/14.
//  Copyright (c) 2014 Leandro Ostera. All rights reserved.
//

#import "PALoginView.h"

@implementation PALoginView

- (id) init {
    self = [super initWithReadPermissions:@[@"public_profile", @"email", @"user_friends", @"user_events"]];
    return self;
}

@end
